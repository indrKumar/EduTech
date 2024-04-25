
class SelectionPopupModel {
  int? id; // Add an ID field
  String title = '';
  dynamic value;
  bool isSelected;

  SelectionPopupModel({
    this.id, // Update constructor to require an ID
    required this.title,
    this.value,
    this.isSelected = false,
  });
}
