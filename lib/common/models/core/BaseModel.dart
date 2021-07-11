/*
 * Marking class for data models
 */
class BaseModel {
  static const int NO_ID = -1;

  const BaseModel();

  /*
   * Validation of data integrity
   */
  bool validate() => true;
}
