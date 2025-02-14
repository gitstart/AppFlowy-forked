import 'package:appflowy/plugins/database/application/cell/cell_controller_builder.dart';
import 'package:appflowy/plugins/database/widgets/row/cells/checklist_cell/checklist_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../row/cells/checklist_cell/checklist_cell_bloc.dart';
import '../define.dart';
import 'card_cell.dart';

class ChecklistCardCell extends CardCell {
  final CellControllerBuilder cellControllerBuilder;
  const ChecklistCardCell({required this.cellControllerBuilder, super.key});

  @override
  State<ChecklistCardCell> createState() => _ChecklistCellState();
}

class _ChecklistCellState extends State<ChecklistCardCell> {
  late ChecklistCellBloc _cellBloc;

  @override
  void initState() {
    final cellController =
        widget.cellControllerBuilder.build() as ChecklistCellController;
    _cellBloc = ChecklistCellBloc(cellController: cellController);
    _cellBloc.add(const ChecklistCellEvent.initial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cellBloc,
      child: BlocBuilder<ChecklistCellBloc, ChecklistCellState>(
        builder: (context, state) {
          if (state.tasks.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: CardSizes.cardCellPadding,
            child: ChecklistProgressBar(
              tasks: state.tasks,
              percent: state.percent,
            ),
          );
        },
      ),
    );
  }
}
