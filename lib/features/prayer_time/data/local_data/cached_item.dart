class CachedItem {
  dynamic data;
  int cachedTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);

  bool isValid(int expiryTime) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTime - cachedTime <= expiryTime;

    return isValid;
  }
}
