package utils;

/**
 * @author Amer Shaker
 */
public interface Constants {

    // Categories Table Columns
    public static final String CATEGORY_NAME = "CATEGORY_NAME";

    // Request Attributes
    public static final String CATEGORIES_LIST_ATTRIBUTE = "categories";
    public static final String PRODUCTS_LIST_ATTRIBUTE = "products";
    public static final String PRODUCT_ATTRIBUTE = "product";

    // Request Parameters
    public static final String ACTION_TYPE_PARAMETER = "actionType";
    public static final String ACTION_TYPE_ADD_PARAMETER = "addProduct";
    public static final String ACTION_TYPE_EDIT_PARAMETER = "editProduct";
    public static final String ACTION_TYPE_DELETE_PARAMETER = "deleteProduct";
    public static final String PRODUCT_ID_PARAMETER = "productId";
    public static final String CATEGORY_ID_PARAMETER = "categoryId";
    public static final String PRODUCT_NAME_PARAMTER = "productName";
    public static final String DESCRIPTION_PARAMTER = "describtion";
    public static final String PRICE_PARAMTER = "price";
    public static final String QUANTITY_PARAMTER = "quantity";
    
    // URL Patterns
    public static final String PRODUCT_LIST_URL_PATTERN = "ec-product-List.jsp";
    public static final String ADD_PRODUCT_URL_PATTERN = "ec-add-product.jsp";
}