/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input_otp.dart`. */

export const inputOtpUsageCode = `RiseInputOtp(
  length: 6,
  onCompleted: (code) => debugPrint('Completed: $code'),
)`;

export const inputOtpFourDigitsCode = `const RiseInputOtp(
  length: 4,
)`;

export const inputOtpDisabledCode = `const RiseInputOtp(
  length: 6,
  isDisabled: true,
)`;

export const inputOtpWithPatternCode = `RiseInputOtp(
  length: 6,
  pattern: RegExp(r'[a-zA-Z]'),
)`;

export const inputOtpControlledCode = `RiseInputOtp(
  length: 6,
  onChanged: (value) => setState(() => otp = value),
)`;

export const inputOtpVariantsCode = `const RiseInputOtp(
  length: 6,
  variant: RiseInputOtpVariant.secondary,
)`;
