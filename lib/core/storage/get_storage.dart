import 'package:get_storage/get_storage.dart';

class StorageService {
  // إنشاء نسخة واحدة فقط من الخدمة (Singleton pattern)
  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  // إنشاء object من GetStorage
  final GetStorage _box = GetStorage();

  // ==================== تهيئة المكتبة ====================
  /// يجب استدعاء هذه الدالة في main.dart قبل runApp
  static Future<void> init() async {
    await GetStorage.init();
  }

  // ==================== القيم الأساسية (Keys) ====================
  static const String _keyIsFirstLaunch = 'is_first_launch';
  static const String _keyLanguage = 'language';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserName = 'user_name';
  static const String _keyUserToken = 'user_token';
  static const String _keyUserPhone = 'user_phone';
  static const String _keyOnboardingSeen = 'onboarding_seen';
  static const String _keyLastRoute = 'last_route';
  static const String _keyCartItems = 'cart_items';
  static const String _keyFavoriteItems = 'favorite_items';
  static const String _keySearchHistory = 'search_history';
  static const String _keyNotificationSettings = 'notification_settings';
  static const String _keyAppFontSize = 'app_font_size';

  // ==================== دوال التهيئة والتشغيل الأولى ====================

  /// التحقق مما إذا كان هذا أول تشغيل للتطبيق
  bool isFirstLaunch() {
    return _box.read(_keyIsFirstLaunch) ?? true;
  }

  /// تعيين قيمة أول تشغيل للتطبيق
  Future<void> setFirstLaunch(bool value) async {
    await _box.write(_keyIsFirstLaunch, value);
  }

  /// التحقق من مشاهدة شاشة التعريف (Onboarding)
  bool isOnboardingSeen() {
    return _box.read(_keyOnboardingSeen) ?? false;
  }

  /// تعيين مشاهدة شاشة التعريف
  Future<void> setOnboardingSeen(bool value) async {
    await _box.write(_keyOnboardingSeen, value);
  }

  // ==================== دوال اللغة والثيم ====================

  /// حفظ اللغة المختارة
  Future<void> setLanguage(String languageCode) async {
    await _box.write(_keyLanguage, languageCode);
  }

  /// قراءة اللغة المحفوظة
  String getLanguage() {
    return _box.read(_keyLanguage) ?? 'ar'; // العربية افتراضياً
  }

  /// حفظ وضع الثيم
  Future<void> setThemeMode(String themeMode) async {
    await _box.write(_keyThemeMode, themeMode);
  }

  /// قراءة وضع الثيم المحفوظ
  String getThemeMode() {
    return _box.read(_keyThemeMode) ?? 'light'; // فاتح افتراضياً
  }

  /// حفظ حجم الخط
  Future<void> setFontSize(double size) async {
    await _box.write(_keyAppFontSize, size);
  }

  /// قراءة حجم الخط المحفوظ
  double getFontSize() {
    return _box.read(_keyAppFontSize) ?? 16.0; // 16 افتراضياً
  }

  // ==================== دوال المستخدم ====================

  /// حفظ حالة تسجيل الدخول
  Future<void> setLoggedIn(bool value) async {
    await _box.write(_keyIsLoggedIn, value);
  }

  /// قراءة حالة تسجيل الدخول
  bool isLoggedIn() {
    return _box.read(_keyIsLoggedIn) ?? false;
  }

  /// حفظ معرف المستخدم
  Future<void> setUserId(String id) async {
    await _box.write(_keyUserId, id);
  }

  /// قراءة معرف المستخدم
  String? getUserId() {
    return _box.read(_keyUserId);
  }

  /// حفظ البريد الإلكتروني
  Future<void> setUserEmail(String email) async {
    await _box.write(_keyUserEmail, email);
  }

  /// قراءة البريد الإلكتروني
  String? getUserEmail() {
    return _box.read(_keyUserEmail);
  }

  /// حفظ اسم المستخدم
  Future<void> setUserName(String name) async {
    await _box.write(_keyUserName, name);
  }

  /// قراءة اسم المستخدم
  String? getUserName() {
    return _box.read(_keyUserName);
  }

  /// حفظ توكن المستخدم
  Future<void> setUserToken(String token) async {
    await _box.write(_keyUserToken, token);
  }

  /// قراءة توكن المستخدم
  String? getUserToken() {
    return _box.read(_keyUserToken);
  }

  /// حفظ رقم هاتف المستخدم
  Future<void> setUserPhone(String phone) async {
    await _box.write(_keyUserPhone, phone);
  }

  /// قراءة رقم هاتف المستخدم
  String? getUserPhone() {
    return _box.read(_keyUserPhone);
  }

  /// حفظ جميع بيانات المستخدم دفعة واحدة
  Future<void> saveUserData({
    required String id,
    required String email,
    required String name,
    String? token,
    String? phone,
  }) async {
    await Future.wait([
      setUserId(id),
      setUserEmail(email),
      setUserName(name),
      if (token != null) setUserToken(token),
      if (phone != null) setUserPhone(phone),
      setLoggedIn(true),
    ]);
  }

  /// حذف جميع بيانات المستخدم (تسجيل الخروج)
  Future<void> clearUserData() async {
    await Future.wait([
      _box.remove(_keyUserId),
      _box.remove(_keyUserEmail),
      _box.remove(_keyUserName),
      _box.remove(_keyUserToken),
      _box.remove(_keyUserPhone),
      setLoggedIn(false),
    ]);
  }

  // ==================== دوال السلة والمفضلة ====================

  /// حفظ عناصر السلة
  Future<void> setCartItems(List<dynamic> items) async {
    await _box.write(_keyCartItems, items);
  }

  /// قراءة عناصر السلة
  List<dynamic> getCartItems() {
    return _box.read(_keyCartItems) ?? [];
  }

  /// إضافة عنصر إلى السلة
  Future<void> addToCart(dynamic item) async {
    final items = getCartItems();
    items.add(item);
    await setCartItems(items);
  }

  /// إزالة عنصر من السلة
  Future<void> removeFromCart(dynamic item) async {
    final items = getCartItems();
    items.remove(item);
    await setCartItems(items);
  }

  /// تفريغ السلة
  Future<void> clearCart() async {
    await _box.remove(_keyCartItems);
  }

  /// حفظ عناصر المفضلة
  Future<void> setFavoriteItems(List<dynamic> items) async {
    await _box.write(_keyFavoriteItems, items);
  }

  /// قراءة عناصر المفضلة
  List<dynamic> getFavoriteItems() {
    return _box.read(_keyFavoriteItems) ?? [];
  }

  /// إضافة عنصر إلى المفضلة
  Future<void> addToFavorites(dynamic item) async {
    final items = getFavoriteItems();
    items.add(item);
    await setFavoriteItems(items);
  }

  /// إزالة عنصر من المفضلة
  Future<void> removeFromFavorites(dynamic item) async {
    final items = getFavoriteItems();
    items.remove(item);
    await setFavoriteItems(items);
  }

  /// التحقق مما إذا كان العنصر في المفضلة
  bool isFavorite(dynamic item) {
    final items = getFavoriteItems();
    return items.contains(item);
  }

  // ==================== دوال البحث ====================

  /// حفظ سجل البحث
  Future<void> setSearchHistory(List<String> history) async {
    await _box.write(_keySearchHistory, history);
  }

  /// قراءة سجل البحث
  List<String> getSearchHistory() {
    return List<String>.from(_box.read(_keySearchHistory) ?? []);
  }

  /// إضافة كلمة بحث إلى السجل
  Future<void> addToSearchHistory(String query) async {
    if (query.trim().isEmpty) return;

    final history = getSearchHistory();

    // إزالة إذا كانت موجودة مسبقاً (لتجنب التكرار)
    history.remove(query);

    // إضافة في البداية
    history.insert(0, query);

    // الاحتفاظ بآخر 10 عمليات بحث فقط
    if (history.length > 10) {
      history.removeLast();
    }

    await setSearchHistory(history);
  }

  /// حذف سجل البحث
  Future<void> clearSearchHistory() async {
    await _box.remove(_keySearchHistory);
  }

  // ==================== دوال الإعدادات ====================

  /// حفظ إعدادات الإشعارات
  Future<void> setNotificationSettings(Map<String, dynamic> settings) async {
    await _box.write(_keyNotificationSettings, settings);
  }

  /// قراءة إعدادات الإشعارات
  Map<String, dynamic> getNotificationSettings() {
    return _box.read(_keyNotificationSettings) ??
        {
          'push_enabled': true,
          'email_enabled': false,
          'sms_enabled': false,
          'promotions_enabled': true,
        };
  }

  /// تحديث إعداد إشعار معين
  Future<void> updateNotificationSetting(String key, bool value) async {
    final settings = getNotificationSettings();
    settings[key] = value;
    await setNotificationSettings(settings);
  }

  /// حفظ آخر صفحة زارها المستخدم
  Future<void> setLastRoute(String route) async {
    await _box.write(_keyLastRoute, route);
  }

  /// قراءة آخر صفحة
  String? getLastRoute() {
    return _box.read(_keyLastRoute);
  }

  // ==================== دوال عامة ====================

  /// حفظ أي قيمة بمفتاح مخصص
  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  /// قراءة أي قيمة بمفتاح مخصص
  dynamic read(String key) {
    return _box.read(key);
  }

  /// حذف قيمة بمفتاح مخصص
  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  /// التحقق من وجود مفتاح
  bool hasData(String key) {
    return _box.hasData(key);
  }

  /// الحصول على جميع المفاتيح
  List<String> getKeys() {
    return _box.getKeys().toList();
  }

  /// مسح جميع البيانات (تحذير: استخدم بحذر)
  Future<void> eraseAll() async {
    await _box.erase();
  }

  /// الاستماع للتغييرات على مفتاح معين
  void listenToKey(String key, Function(dynamic value) callback) {
    _box.listenKey(key, callback);
  }
}

// ==================== نسخة مبسطة للاستخدام السريع ====================
final storage = StorageService();
