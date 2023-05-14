export interface ImagesType {
  data: {
    id: number;
    attributes: {
      url: string;
      name: string;
      formats: {
        large: {
          url: string;
        };
        medium: {
          url: string;
        };
        small: {
          url: string;
        };
        thumbnail: {
          url: string;
        };
      };
    };
  }[];
}

export interface ThumbnailType {
  data: {
    attributes: {
      url: string;
    };
  };
}

export interface ProductSizeType {
  data: {
    size: string;
    enabled: boolean;
  }[];
}
export interface ProductDataType {
  id: number;
  attributes: {
    title: string;
    subtitle: string;
    description: string;
    price: number;
    original_price: number | null;
    size: ProductSizeType;
    slug: string;
    images: ImagesType;
    thumbnail: ThumbnailType;
    categories: CategoriesType;
  };
}
interface PaginationType {
  page: number;
  pageSize: number;
  pageCount: number;
  total: number;
}

export interface ProductsType {
  data: ProductDataType[];
  meta: {
    pagination: PaginationType;
  };
}

export interface CategoryDataType {
  id: number;
  attributes: {
    title: string;
    slug: string;
  };
}

export interface CategoriesType {
  data: CategoryDataType[];
  meta: {
    pagination: PaginationType;
  };
}

export interface SubMenuItemType {
  id: number;
  attributes: {
    title: string;
    slug: string;
  };
}

export interface MenuItemType {
  id: number;
  name: string;
  url?: string;
  subMenu?: SubMenuItemType[];
}

export interface CartType {
  cartItems: CartItemType[];
}

export interface CartItemType {
  id: number;
  title: string;
  subtitle: string;
  size: ProductSizeType;
  price: number;
  slug: string;
  thumbnail: ThumbnailType;
  selectedSize: string;
  selectedQty: number;
}
