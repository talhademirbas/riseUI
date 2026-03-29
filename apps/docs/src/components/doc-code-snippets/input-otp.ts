/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input_otp.dart`. */

export const inputOtpUsageCode = `RiseInputOtp(
  length: 6,
  separatorBuilder: (_) => const RiseInputOtpSeparator(),
  onChanged: (v) {},
  onCompleted: (code) => debugPrint(code),
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

export const inputOtpWithValidationCode = `RiseInputOtp(
  length: 6,
  isInvalid: hasError,
  onChanged: (v) => setState(() => code = v),
)`;

export const inputOtpOnCompleteCode = `RiseInputOtp(
  length: 6,
  onCompleted: (code) => verify(code),
)`;

export const inputOtpFormExampleCode = `RiseInputOtp(
  length: 6,
  onChanged: (v) => setState(() => value = v),
  onCompleted: (_) => submit(),
)`;
