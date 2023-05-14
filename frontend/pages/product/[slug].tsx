import { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import ReactMarkdown from "react-markdown";
import { IoMdHeartEmpty } from "react-icons/io";
import { toast } from "react-toastify";

import { Layout, ProductDetailsCarousel, RelatedProducts } from "@/components";

import { get_discount_percentage, format_price_BDT } from "@/utils";

import {
  fetchAllCategories,
  fetchAllProductSlugs,
  fetchProductBySlug,
  fetch_from_strapi,
  fetch_related_products,
} from "@/utils/strapi";

import { MenuItemType, ProductsType } from "@/types";

import { addToCart } from "@/store/cartSlice";

const qs = require("qs");
const query_swr = (slug: string, pageIndex: number = 1) =>
  qs.stringify({
    populate: ["images", "thumbnail", "categories"],
    filters: { slug: { $eq: slug } },
  });

interface Props {
  navbarMenuItems: MenuItemType[];
  products: ProductsType;
  relatedProducts: ProductsType;
}

const ProductDetails = ({
  navbarMenuItems,
  products,
  relatedProducts,
}: Props) => {
  const [selectedSize, setSelectedSize] = useState("");
  const [showError, setShowError] = useState(false);
  const dispatch = useDispatch();
  const id = products.data[0].id;
  const product = products.data[0].attributes;

  const notify = () => toast.success("Added to cart!");

  return (
    <Layout navbarMenuItems={navbarMenuItems}>
      <div className="w-full py-10 md:py-20">
        <div className="flex flex-col gap-[50px] md:px-10 lg:flex-row lg:gap-[100px]">
          {/* Left Column */}
          <div className="mx-auto w-full max-w-[500px] flex-[1.5] md:w-auto lg:mx-0 lg:max-w-full">
            <ProductDetailsCarousel images={product.images} />
          </div>
          {/* END left */}

          {/* Right Column */}
          <div className="flex-[1] py-3">
            {/* PRODUCT TITLE */}
            <div className="mb-2 text-[34px] font-semibold leading-tight">
              {product.title}
            </div>

            {/* PRODUCT SUBTITLE */}
            <div className="mb-5 text-lg font-semibold">{product.subtitle}</div>

            {/* PRODUCT PRICE */}
            <div className="flex items-center">
              <p className="mr-2 text-lg font-semibold ">
                {format_price_BDT(product.price)}
              </p>

              {product.original_price && (
                <>
                  <p className="text-base  font-medium line-through">
                    {format_price_BDT(product.original_price)}
                  </p>
                  <p className="ml-auto text-base font-medium text-green-500">
                    {get_discount_percentage(
                      product.original_price,
                      product.price
                    )}
                    % off
                  </p>
                </>
              )}
            </div>

            <div className="text-md font-medium text-black/[0.5]">
              incl. of taxes
            </div>
            <div className="text-md mb-20 font-medium text-black/[0.5]">
              (Also includes all applicable duties)
            </div>

            {/* PRODUCT SIZE RANGE START */}
            <div className="mb-10">
              {/* HEADING START */}
              <div className="mb-2 flex justify-between">
                <div className="text-md font-semibold">Select Size</div>
                <div className="text-md cursor-pointer font-medium text-black/[0.5]">
                  Select Guide
                </div>
              </div>
              {/* HEADING END */}

              {/* SIZE START */}
              <div id="sizesGrid" className="grid grid-cols-3 gap-2">
                {product.size.data.map((size, index) => (
                  <button
                    key={index}
                    className={`rounded-md border py-3 text-center font-medium hover:border-black disabled:bg-black/10 disabled:opacity-50 disabled:hover:border-0 ${
                      selectedSize === size.size && "border-black"
                    }`}
                    disabled={!size.enabled}
                    onClick={() => {
                      setSelectedSize(size.size);
                      setShowError(false);
                    }}
                  >
                    {size.size}
                  </button>
                ))}
              </div>
              {/* SIZE END */}

              {/* SHOW ERROR START */}
              <div
                className={`mt-1 text-red-600 ${showError ? "" : "invisible"}`}
              >
                Size selection is required
              </div>
              {/* SHOW ERROR END */}
            </div>
            {/* PRODUCT SIZE RANGE END */}

            {/* ADD TO CART BUTTON START */}
            <button
              className="mb-3 w-full rounded-full bg-black py-4 text-lg font-medium text-white transition-transform hover:opacity-75 active:scale-95"
              onClick={() => {
                if (!selectedSize) {
                  setShowError(true);
                  document.getElementById("sizesGrid")?.scrollIntoView({
                    block: "center",
                    behavior: "smooth",
                  });
                } else {
                  dispatch(
                    addToCart({
                      id,
                      title: product.title,
                      subtitle: product.subtitle,
                      size: product.size,
                      price: product.price,
                      thumbnail: product.thumbnail.data.attributes.url,
                      slug: product.slug,
                      selectedSize,
                      selectedQty: 1,
                    })
                  );
                  notify();
                  setSelectedSize("");
                }
              }}
            >
              Add to Cart
            </button>
            {/* ADD TO CART BUTTON END */}

            {/* WHISHLIST BUTTON START */}
            <button className="mb-10 flex w-full items-center justify-center gap-2 rounded-full border border-black py-4 text-lg font-medium transition-transform hover:opacity-75 active:scale-95">
              Whishlist
              <IoMdHeartEmpty size={20} />
            </button>
            {/* WHISHLIST BUTTON END */}

            <div>
              <div className="mb-5 text-lg font-bold">Product Details</div>
              <div className="markdown text-md mb-5">
                <ReactMarkdown>{product.description}</ReactMarkdown>
              </div>
            </div>
          </div>
          {/* right column end */}
        </div>
        <RelatedProducts products={relatedProducts} />
      </div>
    </Layout>
  );
};

export default ProductDetails;

export async function getStaticPaths() {
  // fetch products keeping only the slug
  const { data } = await fetchAllProductSlugs();

  // get paths from categories slug
  const paths = data.map((item) => ({
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
  const navbarMenuItems = [
    { id: 1, name: "Home", url: "/" },
    { id: 2, name: "About", url: "/about" },
    { id: 3, name: "Categories", subMenu: categories.data },
    { id: 4, name: "Contact", url: "/contact" },
    { id: 5, name: "Blog", url: "/blog" },
  ];

  const products = await fetchProductBySlug(slug);
  const relatedProducts = await fetch_related_products(products);
  return { props: { navbarMenuItems, products, relatedProducts } };
}
