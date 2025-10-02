import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';

class MainFab extends StatelessWidget {
  const MainFab({super.key});

  @override
  Widget build(BuildContext context) {
    final fabKey = GlobalKey<ExpandableFabState>();

    return ExpandableFab(
      key: fabKey,
      pos: ExpandableFabPos.right,
      type: ExpandableFabType.up,
      duration: const Duration(milliseconds: 400),
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withValues(alpha: 0.5),
      ),
      openButtonBuilder: FloatingActionButtonBuilder(
        size: 56,
        builder: (context, onTap, progress) {
          return _AnimatedFabButton(
            icon: const Icon(Icons.add, size: 28),
            progress: progress,
            onTap: onTap,
          );
        },
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        size: 56,
        builder: (context, onTap, progress) {
          return _AnimatedFabButton(
            icon: const Icon(Icons.close, size: 28),
            progress: progress,
            onTap: onTap,
          );
        },
      ),
      children: [
        _FabAction(
          icon: Icons.remove_circle_outline,
          label: 'Expense',
          onPressed: () {
            fabKey.currentState?.toggle();
            context.push('/add-expense');
          },
        ),
        _FabAction(
          icon: Icons.compare_arrows,
          label: 'Transfer',
          onPressed: () {
            fabKey.currentState?.toggle();
            context.push('/add-transfer');
          },
        ),
        _FabAction(
          icon: Icons.add_circle_outline,
          label: 'Income',
          onPressed: () {
            fabKey.currentState?.toggle();
            context.push('/add-income');
          },
        ),
      ],
    );
  }
}

class _FabAction extends StatelessWidget {
  const _FabAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton.small(
          heroTag: null,
          onPressed: onPressed,
          child: Icon(icon),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class _AnimatedFabButton extends StatelessWidget {
  const _AnimatedFabButton({
    required this.icon,
    required this.progress,
    required this.onTap,
  });

  final Widget icon;
  final Animation<double> progress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, _) {
        return Transform.rotate(
          angle: progress.value * (math.pi / 2),
          child: FloatingActionButton(onPressed: onTap, child: icon),
        );
      },
    );
  }
}
