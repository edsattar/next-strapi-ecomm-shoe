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
import { MenuItemType } from "@/types";
import { checkout_request } from "@/utils";

import { loadStripe, Stripe } from "@stripe/stripe-js";

const stripePromise = loadStripe(
  process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY!
);

export async function getStaticProps() {
  const categories = await fetchAllCategories();
  const navbarMenuItems = [
    { id: 1, name: "Home", url: "/" },
    { id: 2, name: "About", url: "/about" },
    { id: 3, name: "Categories", subMenu: categories.data },
    { id: 4, name: "Contact", url: "/contact" },
    { id: 5, name: "Blog", url: "/blog" },
  ];
  return { props: { navbarMenuItems } };
}

interface Props {
  navbarMenuItems: MenuItemType[];
}

const Cart = ({ navbarMenuItems }: Props) => {
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
  return (
    <Layout navbarMenuItems={navbarMenuItems}>
      <div className="w-full md:p-10 m-auto">
      {/* Header ---------- */}
      <div className="mx-auto mt-8  text-center md:mt-0">
        <div className="mb-5 text-[28px] font-semibold leading-tight md:text-[34px]">
          Shopping Cart
        </div>
      </div>
        {cartItems.length > 0 && (
          <>
            <div className="flex min-w-[360px] flex-col gap-12 py-10 lg:flex-row">
              {/* Cart Items ---------- */}
              <div className="flex-[2]">
                <div className="mb-4 text-lg font-bold">Cart Items</div>
                {cartItems.map((item, index) => (
                  <CartItem key={index} cartItem={item} cartItemId={index} />
                ))}
              </div>

              {/* Summary ---------- */}
              <div className="flex-[1]">
                <OrderSummary subTotal={subTotal} />
                <CheckoutButton onClick={handle_checkout} loading={loading} />
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
