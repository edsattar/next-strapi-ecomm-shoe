import axios from "axios";
import { CategoriesType, CategoryDataType, ProductsType } from "@/types";
import qs from "qs";

// Create a pre-configured instance of axios with base URL and headers
const api = axios.create({
  baseURL: process.env.NEXT_PUBLIC_STRAPI_API_URL,
  headers: {
    Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_JWT}`,
  },
});

/**
 * Makes a GET request to the given Strapi API endpoint and returns the data.
 */
export const fetch_from_strapi = async (endpoint: string): Promise<any> => {
  const { data } = await api.get(endpoint);
  return data;
};

/**
 * Constructs a query string for fetching products.
 */
export const construct_product_query = (
  page: number,
  pageSize: number,
  additionalFilters: object = {}
): string => {
  return qs.stringify(
    {
      fields: ["title", "price", "original_price", "slug"],
      populate: { thumbnail: { fields: ["url"] } },
      pagination: { page, pageSize },
      filters: additionalFilters,
    },
    { encodeValuesOnly: true }
  );
};

/**
 * Fetches all products with pagination.
 */
export const fetch_all_products = async ({
  page,
  pageSize,
}: {
  page: number;
  pageSize: number;
}): Promise<ProductsType> => {
  const query = construct_product_query(page, pageSize);
  const products = await fetch_from_strapi(`/api/products?${query}`);
  return products;
};

/**
 * Fetches products of a specific category with pagination.
 */
export const fetch_products_of_category = async ({
  slug,
  page = 1,
  pageSize = 12,
}: {
  slug: string;
  page?: number;
  pageSize?: number;
}): Promise<ProductsType> => {
  const query = construct_product_query(page, pageSize, {
    categories: { slug: { $eq: slug } },
  });
  const products = await fetch_from_strapi(`/api/products?${query}`);
  return products;
};
/**
 * Fetches related products based on product categories.
 */
export const fetch_related_products = async (
  products: ProductsType
): Promise<ProductsType> => {
  const product_categories = products.data[0].attributes.categories.data.map(
    (item: CategoryDataType) => item.id
  );

  const query = construct_product_query(1, 100, {
    slug: { $ne: products.data[0].attributes.slug },
    categories: { id: { $eq: product_categories } },
  });
  //   const query = qs.stringify(
  // {
  //   populate: "thumbnail",
  //   filters: {
  //     slug: { $ne: products.data[0].attributes.slug },
  //     categories: { id: { $eq: product_categories } },
  //   },
  // },
  // { encodeValuesOnly: true }
  // );

  return await fetch_from_strapi(`/api/products?${query}`);
};

/**
 * Fetches a single product by slug.
 * @param slug
 */
export const fetchProductBySlug = async (
  slug: string
): Promise<ProductsType> => {
  const query = qs.stringify(
    {
      populate: "*",
      filters: { slug: { $eq: slug } },
    },
    { encode: false }
  );
  const product = await fetch_from_strapi(`/api/products?${query}`);
  return product;
};

/**
 * Fetches categories for the navigation bar.
 */
export const fetchAllCategories = async (): Promise<CategoriesType> => {
  const query_swr = qs.stringify(
    { fields: ["title", "slug"] },
    { encodeValuesOnly: true }
  );

  const response = await fetch_from_strapi(`/api/categories?${query_swr}`);
  return response;
};

/**
 * Fetches all product slugs for the static paths.
 */
export const fetchAllProductSlugs = async (): Promise<ProductsType> => {
  const query = qs.stringify({ fields: ["slug"] },
    { encodeValuesOnly: true });
  const response = await fetch_from_strapi(`/api/products?${query}`);
  return response;
}
