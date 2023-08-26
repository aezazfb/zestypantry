class ItemAvailable{
  bool available;
  int noOfItems;

  ItemAvailable(
      this.available,
      this.noOfItems
      );
}

class ItemsNotAvailable{
  bool available;
  String namesConcatenated;
  String quantityLeft;

  ItemsNotAvailable(
      this.available,
      this.namesConcatenated,
      this.quantityLeft
      );
}