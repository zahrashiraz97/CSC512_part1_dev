// CSC 512 Project - Branch and Function Pointer Analysis
// Student: <Your Name>
// GitHub: <Your GitHub Link>

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include "nlohmann/json.hpp"
#include <fstream>
#include <unordered_map>
#include <string>

using namespace llvm;
using Json = nlohmann::json;

namespace {

Json jsonOutput;
std::unordered_map<BranchInst *, int> branchIdMap;
int branchCounter = 1;

void recordBranchInfo(BranchInst *BI, const std::string &filePath) {
    if (BI->isConditional()) {
        // Assign a unique ID to each branch instruction
        if (branchIdMap.find(BI) == branchIdMap.end()) {
            branchIdMap[BI] = branchCounter++;
        }
        int branchId = branchIdMap[BI];
        int sourceLine = BI->getDebugLoc() ? BI->getDebugLoc().getLine() : -1;
        int destinationLine = -1;

        if (sourceLine != -1 && BI->getNumSuccessors() > 0) {
            BasicBlock *successorBlock = BI->getSuccessor(0);
            if (!successorBlock->empty()) {
                Instruction &firstInstruction = *successorBlock->begin();
                if (firstInstruction.getDebugLoc()) {
                    destinationLine = firstInstruction.getDebugLoc().getLine();
                }
            }
        }

        jsonOutput.push_back({
            {"file_path", filePath},
            {"branch_id", branchId},
            {"source_line", sourceLine},
            {"destination_line", destinationLine}
        });
    }
}

void handleFunctionPointers(CallInst *callInstruction) {
    if (callInstruction->isIndirectCall()) {
        if (Value *calledOperand = callInstruction->getCalledOperand()) {
            errs() << "*function_pointer_" << calledOperand << "\n";
        }
    }
}

void processInstructions(Function &function) {
    std::string filePath;
    if (DISubprogram *subprogram = function.getSubprogram()) {
        filePath = subprogram->getDirectory().str() + "/" + subprogram->getFilename().str();
    }

    for (auto &instruction : instructions(function)) {
        if (auto *branchInstruction = dyn_cast<BranchInst>(&instruction)) {
            recordBranchInfo(branchInstruction, filePath);
        }
        if (auto *callInstruction = dyn_cast<CallInst>(&instruction)) {
            handleFunctionPointers(callInstruction);
        }
    }
}

struct BranchAndPointerAnalysisPass : PassInfoMixin<BranchAndPointerAnalysisPass> {
    PreservedAnalyses run(Function &function, FunctionAnalysisManager &) {
        processInstructions(function);
        return PreservedAnalyses::all();
    }

    static bool isRequired() { return true; }
};

} // namespace

// Plugin registration for the New Pass Manager
llvm::PassPluginLibraryInfo getBranchPointerAnalysisPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "BranchAndPointerAnalysisPass",
        LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef name, FunctionPassManager &FPM, ArrayRef<PassBuilder::PipelineElement>) {
                    if (name == "branch-pointer-pass") {
                        FPM.addPass(BranchAndPointerAnalysisPass());
                        return true;
                    }
                    return false;
                });
        }};
}

// Export plugin information for dynamic loading
extern "C" ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getBranchPointerAnalysisPluginInfo();
}

// Final output to JSON file and formatted console output
struct OutputHandler {
    ~OutputHandler() {
        std::ofstream outFile("branch_analysis.json");
        outFile << jsonOutput.dump(4);
        outFile.close();

        for (const auto &branch : jsonOutput) {
            errs() << "branch_" << branch["branch_id"].get<int>() << ": ";
            errs() << branch["file_path"].get<std::string>() << ", ";
            errs() << branch["source_line"].get<int>() << ", ";
            errs() << branch["destination_line"].get<int>() << "\n";
        }
    }
} finalOutputHandler;
