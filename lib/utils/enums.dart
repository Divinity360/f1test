enum FilterType {
  ByNameAZ,
  ByNameZA,
  ByPriceBig,
  ByPriceSmall,
  ByPoints,
}
int getSortedIndex(FilterType type) {
  switch (type) {
    case FilterType.ByNameAZ:
      return 0;
      break;
    case FilterType.ByNameZA:
      return 1;
      break;
    case FilterType.ByPriceBig:
      return 2;
      break;
    case FilterType.ByPriceSmall:
      return 3;
      break;
    case FilterType.ByPoints:
      return 4;
      break;
  }
  return 0;
}

FilterType getFilterType(int index) {
  switch (index) {
    case 0:
      return FilterType.ByNameAZ;
    case 1:
      return FilterType.ByNameZA;
    case 2:
      return FilterType.ByPriceBig;
    case 3:
      return FilterType.ByPriceSmall;
    case 4:
      return FilterType.ByPoints;
  }
  return FilterType.ByNameAZ;
}