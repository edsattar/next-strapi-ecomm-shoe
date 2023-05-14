import React, { useMemo, useState } from "react";
import {
  Layout,
  CartItem,
  OrderSummary,
  EmptyCart,
  CheckoutButton,
} from "@/components";
import { useSelector } from "react-redux";
import { RootState } from "@/store/store";
import { fetchAllCategories } from "@/utils/strapi";
import { CategoriesType } from "@/types";

import { checkout_request } from "@/utils";

import { loadStripe, Stripe } from "@stripe/stripe-js";
const stripePromise = loadStripe(
  process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY!
);

interface Props {
  categories: CategoriesType;
}

const Cart = ({ categories }: Props) => {
  const [loading, setLoading] = useState(false);
  const { cartItems } = useSelector((state: RootState) => state.cart);

  const subTotal = useMemo(() => {
    return cartItems.reduce(
      (total, cartItem) => total + cartItem.price * cartItem.selectedQty,
      0
    );
  }, [cartItems]);

  const handle_checkout = async () => {
    try {
      setLoading(true);
      const stripe = await stripePromise;
      const res = await checkout_request("/api/orders", {
        cartItems,
      });
      if (stripe) {
        console.log("res", res);
        const { error } = await stripe.redirectToCheckout({
          sessionId: res.stripeSession.id,
        });
        if (error) {
          console.log("error", error);
        }
      }
    } catch (error) {
      setLoading(false);
      console.log(error);
    }
  };

  const menuItems = [
    { id: 1, name: "Home", url: "/" },
    { id: 2, name: "About", url: "/about" },
    { id: 3, name: "Categories", subMenu: categories.data },
    { id: 4, name: "Contact", url: "/contact" },
    { id: 5, name: "Blog", url: "/blog" },
  ];

  return (
    <Layout navbarMenuItems={menuItems}>
      <div className="w-full md:py-20">
        {cartItems.length > 0 && (
          <>
            {/* Header ---------- */}
            <div className="mx-auto mt-8 max-w-[800px] text-center md:mt-0">
              <div className="mb-5 text-[28px] font-semibold leading-tight md:text-[34px]">
                Shopping Cart
              </div>
            </div>
            {/* ---------- Header */}

            <div className="flex min-w-[432px] flex-col gap-12 py-10 lg:flex-row">
              {/* Cart Items ---------- */}
              <div className="flex-[2]">
                <div className="mb-4 text-lg font-bold">Cart Items</div>
                {cartItems.map((item, index) => (
                  <CartItem key={index} cartItem={item} cartItemId={index} />
                ))}
              </div>
              {/* ---------- Cart Items */}

              {/* Summary Section ---------- */}
              <div className="flex-[1]">
                <OrderSummary subTotal={subTotal} />
                <CheckoutButton onClick={handle_checkout} loading={loading} />
                {/* <button
                  className="mb-3 flex w-full items-center justify-center gap-2 rounded-full bg-black py-4 text-lg font-medium text-white transition-transform hover:opacity-75 active:scale-95"
                  onClick={handle_checkout}
                >
                  Checkout
                  {loading && <img src="/spinner.svg" />}
                </button> */}
              </div>
            </div>
          </>
        )}

        {/* If Empty Cart ---------- */}
        {cartItems.length < 1 && <EmptyCart />}
      </div>
    </Layout>
  );
};

export default Cart;

export async function getStaticProps() {
  const categories = await fetchAllCategories();
  return { props: { categories } };
}
