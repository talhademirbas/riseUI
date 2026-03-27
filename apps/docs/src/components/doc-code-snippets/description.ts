/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_description.dart`. */

export const descriptionUsageCode = `const RiseDescription(
  child: Text("We'll never share your email with anyone else."),
)`;

export const descriptionWithFormFieldCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const RiseLabel(child: Text('Password')),
    const SizedBox(height: 6),
    const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
    const SizedBox(height: 6),
    const RiseDescription(
      child: Text('Must be at least 8 characters with one uppercase letter.'),
    ),
  ],
)`;

export const descriptionWithTextFieldCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const RiseTextField(labelText: 'Project name', hintText: 'Rise UI kit'),
    const SizedBox(height: 6),
    const RiseDescription(child: Text('Used in URLs and dashboard headers.')),
  ],
)`;
