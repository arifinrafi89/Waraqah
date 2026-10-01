import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/usecases/create_coupon.dart';
import '../providers/coupon_admin_providers.dart';
import 'checkout_labels.dart';
import 'coupon_amount_fields.dart';
import 'coupon_expiry_row.dart';

/// The New coupon form. Problems show under it; it stays open until the
/// coupon is saved, then closes with `true`.
class NewCouponForm extends ConsumerStatefulWidget {
  const NewCouponForm({super.key});

  @override
  ConsumerState<NewCouponForm> createState() => NewCouponFormState();
}

class NewCouponFormState extends ConsumerState<NewCouponForm> {
  final _code = TextEditingController();
  final _value = TextEditingController();
  final _cap = TextEditingController();
  final _min = TextEditingController();
  var _kind = CouponKind.percentOff;
  DateTime? _expiry;
  String? _error;
  var _busy = false;

  @override
  void dispose() {
    for (final c in [_code, _value, _cap, _min]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(l10n.adminOrderNewCoupon, style: context.texts.titleMedium),
          AppTextField(
            label: l10n.adminOrderCouponCode,
            hint: l10n.adminOrderCouponCodeHint,
            controller: _code,
          ),
          CouponAmountFields(
            kind: _kind,
            onKindChanged: (kind) => setState(() => _kind = kind),
            value: _value,
            cap: _cap,
            minOrder: _min,
          ),
          CouponExpiryRow(
            expiry: _expiry,
            onChanged: (date) => setState(() => _expiry = date),
          ),
          if (_error != null)
            Text(
              _error!,
              style: AppFonts.ui(size: 12, color: context.palette.danger),
            ),
          PrimaryButton(
            label: l10n.adminOrderCouponCreate,
            isBusy: _busy,
            onPressed: _create,
          ),
        ],
      ),
    );
  }

  Future<void> _create() async {
    final l10n = AppL10n.of(context)!;
    int? read(TextEditingController c) => int.tryParse(c.text.trim());
    setState(() => _busy = true);
    try {
      await ref
          .read(couponsProvider.notifier)
          .create(
            Coupon(
              code: _code.text,
              kind: _kind,
              value: _kind == CouponKind.freeDelivery ? 0 : read(_value) ?? 0,
              minOrderBdt: read(_min) ?? 0,
              maxDiscountBdt: _kind == CouponKind.percentOff
                  ? read(_cap)
                  : null,
              expiresAt: _expiry,
            ),
          );
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      setState(
        () => _error = e is CouponNotCreated
            ? l10n.couponFormProblem(e.problem)
            : l10n.commonSomethingWentWrong,
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
