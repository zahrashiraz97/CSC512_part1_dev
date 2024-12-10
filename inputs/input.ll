; ModuleID = 'inputs/input.c'
source_filename = "inputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"Enter a positive number: \00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%u\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [30 x i8] c"The digital root of %u is %u\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata ptr %3, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, ptr %4, align 4, !dbg !38
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !39
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2), !dbg !40
  %8 = load i32, ptr %2, align 4, !dbg !41
  store i32 %8, ptr %3, align 4, !dbg !42
  br label %9, !dbg !43

9:                                                ; preds = %27, %0
  %10 = load i32, ptr %3, align 4, !dbg !44
  %11 = icmp ne i32 %10, 0, !dbg !45
  br i1 %11, label %12, label %28, !dbg !43

12:                                               ; preds = %9
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !48
  %13 = load i32, ptr %3, align 4, !dbg !49
  %14 = urem i32 %13, 10, !dbg !50
  store i32 %14, ptr %5, align 4, !dbg !48
  %15 = load i32, ptr %5, align 4, !dbg !51
  %16 = load i32, ptr %4, align 4, !dbg !52
  %17 = add i32 %16, %15, !dbg !52
  store i32 %17, ptr %4, align 4, !dbg !52
  %18 = load i32, ptr %3, align 4, !dbg !53
  %19 = udiv i32 %18, 10, !dbg !53
  store i32 %19, ptr %3, align 4, !dbg !53
  %20 = load i32, ptr %3, align 4, !dbg !54
  %21 = icmp eq i32 %20, 0, !dbg !56
  br i1 %21, label %22, label %27, !dbg !57

22:                                               ; preds = %12
  %23 = load i32, ptr %4, align 4, !dbg !58
  %24 = icmp ugt i32 %23, 9, !dbg !59
  br i1 %24, label %25, label %27, !dbg !60

25:                                               ; preds = %22
  %26 = load i32, ptr %4, align 4, !dbg !61
  store i32 %26, ptr %3, align 4, !dbg !63
  store i32 0, ptr %4, align 4, !dbg !64
  br label %27, !dbg !65

27:                                               ; preds = %25, %22, %12
  br label %9, !dbg !43, !llvm.loop !66

28:                                               ; preds = %9
  %29 = load i32, ptr %2, align 4, !dbg !69
  %30 = load i32, ptr %4, align 4, !dbg !70
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %29, i32 noundef %30), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "inputs/input.c", directory: "/home/zshiraz/part1-dev", checksumkind: CSK_MD5, checksum: "56b4a3de453f1f51cedd0ab69ac316c7")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 208, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 26)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 12, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 23, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 30)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !18, splitDebugInlining: false, nameTableKind: None)
!18 = !{!0, !7, !12}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 8, !"PIC Level", i32 2}
!23 = !{i32 7, !"PIE Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 2}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!27 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !28, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !31)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{}
!32 = !DILocalVariable(name: "number", scope: !27, file: !2, line: 10, type: !33)
!33 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 10, column: 17, scope: !27)
!35 = !DILocalVariable(name: "temp", scope: !27, file: !2, line: 10, type: !33)
!36 = !DILocation(line: 10, column: 25, scope: !27)
!37 = !DILocalVariable(name: "droot", scope: !27, file: !2, line: 10, type: !33)
!38 = !DILocation(line: 10, column: 31, scope: !27)
!39 = !DILocation(line: 11, column: 4, scope: !27)
!40 = !DILocation(line: 12, column: 4, scope: !27)
!41 = !DILocation(line: 13, column: 11, scope: !27)
!42 = !DILocation(line: 13, column: 9, scope: !27)
!43 = !DILocation(line: 14, column: 4, scope: !27)
!44 = !DILocation(line: 14, column: 10, scope: !27)
!45 = !DILocation(line: 14, column: 15, scope: !27)
!46 = !DILocalVariable(name: "digit", scope: !47, file: !2, line: 15, type: !30)
!47 = distinct !DILexicalBlock(scope: !27, file: !2, line: 14, column: 21)
!48 = !DILocation(line: 15, column: 11, scope: !47)
!49 = !DILocation(line: 15, column: 19, scope: !47)
!50 = !DILocation(line: 15, column: 24, scope: !47)
!51 = !DILocation(line: 16, column: 16, scope: !47)
!52 = !DILocation(line: 16, column: 13, scope: !47)
!53 = !DILocation(line: 17, column: 12, scope: !47)
!54 = !DILocation(line: 18, column: 10, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !2, line: 18, column: 10)
!56 = !DILocation(line: 18, column: 15, scope: !55)
!57 = !DILocation(line: 18, column: 20, scope: !55)
!58 = !DILocation(line: 18, column: 23, scope: !55)
!59 = !DILocation(line: 18, column: 29, scope: !55)
!60 = !DILocation(line: 18, column: 10, scope: !47)
!61 = !DILocation(line: 19, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !55, file: !2, line: 18, column: 34)
!63 = !DILocation(line: 19, column: 15, scope: !62)
!64 = !DILocation(line: 20, column: 16, scope: !62)
!65 = !DILocation(line: 21, column: 7, scope: !62)
!66 = distinct !{!66, !43, !67, !68}
!67 = !DILocation(line: 22, column: 4, scope: !27)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 23, column: 45, scope: !27)
!70 = !DILocation(line: 23, column: 53, scope: !27)
!71 = !DILocation(line: 23, column: 4, scope: !27)
!72 = !DILocation(line: 24, column: 4, scope: !27)
