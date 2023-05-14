import { HeroBanner, Wrapper, ProductCard, Footer, Navbar } from "@/components";
import { ProductsType, CategoriesType } from "@/types";
import { fetchAllCategories, fetch_all_products } from "@/utils/strapi";

import { Urbanist } from "next/font/google";
const urbanist = Urbanist({ subsets: ["latin"] });

interface Props {
  all_products: ProductsType;
  categories: CategoriesType;
}

export default function Home({ all_products, categories }: Props) {
  const menuItems = [
    { id: 1, name: "Home", url: "/" },
    { id: 2, name: "About", url: "/about" },
    { id: 3, name: "Categories", subMenu: categories.data },
    { id: 4, name: "Contact", url: "/contact" },
    { id: 5, name: "Blog", url: "/blog" },
  ];

  return (
    <main className={urbanist.className}>
      <Navbar menuItems={menuItems} />
      <HeroBanner />
      <Wrapper>
        <div className="mx-auto my-12 max-w-lg text-center md:my-20 md:max-w-7xl">
          <div className="mb-5 text-xl font-semibold leading-tight md:text-3xl">
            Cushioning for Your Miles
          </div>
          <div className="text-md md:text:xl">
            A lightweight Nike ZoomX midsole is combined with increased stack to
            help provide cushioning during extended stretches of running.
          </div>
          {/* Products Grid ---------- */}
          <div className="my-14 grid grid-cols-2 gap-5 px-5 md:grid-cols-3 md:px-0 lg:grid-cols-4">
            {all_products.data.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
          {/* ---------- Products Grid */}
        </div>
      </Wrapper>
      <Footer />
    </main>
  );
}
export async function getStaticProps() {
  const all_products = await fetch_all_products({
    page: 1,
    pageSize: 100,
  });
  const categories = await fetchAllCategories();
  return { props: { all_products, categories } };
}
