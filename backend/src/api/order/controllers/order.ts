import { CartType } from "../../../types";

const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);
/**
 * order controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController(
  "api::order.order",
  ({ strapi }) => ({
    async create(ctx) {
      const { cartItems }: CartType = ctx.request.body;
      try {
        const lineItems = await Promise.all(
          cartItems.map(async (cartItem) => {
            // console.log("this is product------->", cartItem);

            return {
              price_data: {
                currency: "bdt",
                product_data: {
                  name: cartItem.title,
                },
                unit_amount: Math.round(cartItem.price * 100),
              },
              quantity: cartItem.selectedQty,
            };
          })
        );

        const session = await stripe.checkout.sessions.create({
          shipping_address_collection: { allowed_countries: ["IN"] },
          payment_method_types: ["card"],
          mode: "payment",
          success_url: process.env.CLIENT_URL + `/success`,
          cancel_url: process.env.CLIENT_URL + "/failed",
          line_items: lineItems,
        });

        await strapi
          .service("api::order.order")
          .create({ data: { products: cartItems, stripe_id: session.id } });

        return { stripeSession: session };
      } catch (error) {
        ctx.response.status = 500;
        return { error };
      }
    },
  })
);
