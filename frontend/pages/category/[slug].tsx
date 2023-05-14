import useSWR from "swr";

import { Layout, ProductCard } from "@/components";

import {
  fetch_from_strapi,
  fetchAllCategories,
  fetch_products_of_category,
} from "@/utils/strapi";
import {
  MenuItemType,
  ProductsType,
  ProductDataType,
  CategoriesType,
} from "@/types";
import { useState } from "react";
import qs from "qs";

const pageSize = 3;

interface Props {
  categories: CategoriesType;
  products: ProductsType;
  slug: string;
}

const Category = ({ categories, products, slug }: Props) => {
  const [page, setPage] = useState(1);

  const { data, error, isLoading } = useSWR(
    { slug, page, pageSize },
    fetch_products_of_category
  );

  const navbarMenuItems = [
    { id: 1, name: "Home", url: "/" },
    { id: 2, name: "About", url: "/about" },
    { id: 3, name: "Categories", subMenu: categories.data },
    { id: 4, name: "Contact", url: "/contact" },
    { id: 5, name: "Blog", url: "/blog" },
  ];

  return (
    <Layout navbarMenuItems={navbarMenuItems}>
      <div className="w-full md:py-20">
        <div className="mx-auto mt-8 text-center md:mt-0">
          <div className="mb-5 text-3xl font-semibold capitalize leading-tight md:text-4xl">
            {slug}
          </div>
        </div>
        {data && (
          <>
            {/* PRODUCT GRID */}
            <div className="my-14 grid grid-cols-1 gap-5 px-5 md:grid-cols-2 md:px-0 lg:grid-cols-3">
              {data?.data.map((product: ProductDataType) => (
                <ProductCard key={product.id} product={product} />
              ))}
            </div>
            {/* END PRODUCT GRID */}

            {/* PAGINATION BUTTONS START */}
            {data?.meta?.pagination?.total > pageSize && (
              <div className="my-16 flex items-center justify-center gap-3 md:my-0">
                <button
                  className="rounded bg-black px-4 py-2 text-white disabled:bg-gray-200 disabled:text-gray-500"
                  disabled={page === 1}
                  onClick={() => setPage(page - 1)}
                >
                  Previous
                </button>

                <span className="font-bold">{`${page} of ${
                  data && data.meta.pagination.pageCount
                }`}</span>

                <button
                  className="rounded bg-black px-4 py-2 text-white disabled:bg-gray-200 disabled:text-gray-500"
                  disabled={page === (data && data.meta.pagination.pageCount)}
                  onClick={() => setPage(page + 1)}
                >
                  Next
                </button>
              </div>
            )}
            {/* END PAGINATION BUTTONS */}
          </>
        )}
        {isLoading && (
          <div className="absolute left-0 top-0 flex h-full w-full flex-col items-center justify-center gap-5 bg-white/[0.5]">
            <img src="/logo.svg" width={150} />
            <span className="text-2xl font-medium">Loading...</span>
          </div>
        )}
      </div>
    </Layout>
  );
};

export default Category;

export async function getStaticPaths() {
  // fetch categories keeping only the slug
  const { data }: CategoriesType = await fetch_from_strapi(
    "/api/categories?fields[0]=slug"
  );

  // get paths from categories slug
  const paths = data?.map((item) => ({
    params: { slug: item.attributes.slug },
  }));

  return { paths, fallback: false };
}

export async function getStaticProps({
  params: { slug },
}: {
  params: { slug: string };
}) {
  // fetch categories keeping only the title and slug for navbar
  const categories = await fetchAllCategories();

  // fetch products where catergory slug is equal to slug
  const products = await fetch_products_of_category({
    slug,
    page: 1,
    pageSize: pageSize,
  });

  return { props: { categories, products, slug } };
}
