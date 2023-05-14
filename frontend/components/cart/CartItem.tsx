import { useState } from "react";
import { RiDeleteBin6Line } from "react-icons/ri";
import { useDispatch } from "react-redux";
import Image from "next/image";
import Link from "next/link";
import { CartItemType } from "@/types";
import { format_price_BDT } from "@/utils";
import { updateCart, removeFromCart } from "@/store/cartSlice";

interface Props {
  cartItem: CartItemType;
  cartItemId: number;
}

const CartItem = ({ cartItem, cartItemId }: Props) => {
  const [showUpdateBtn, setShowUpdateBtn] = useState<boolean>(false);
  const [selectedSize, setSelectedSize] = useState<string>(
    cartItem.selectedSize
  );
  const [selectedQty, setSelectedQty] = useState<number>(cartItem.selectedQty);

  const dispatch = useDispatch();

  return (
    <div className="mt-2 flex items-end gap-3 overflow-hidden border-b md:h-36 md:gap-5">
      {/* ------- Product Image ------- */}
      <div className="aspect-square w-20 shrink-0 md:w-36">
        <Image
          src={cartItem.thumbnail}
          alt={cartItem.title}
          width={200}
          height={200}
        />
      </div>
      <div className="mb-2 flex w-full flex-col">
        <div className="flex flex-row justify-between md:flex-row">
          {/* ------- Product Title ------- */}
          <Link
            href={`/product/${cartItem.slug}`}
            className="text-lg font-semibold text-black/[0.8] md:text-2xl"
          >
            {cartItem.title}
          </Link>

          {/* ------- Trash Icon ------- */}
          <RiDeleteBin6Line
            onClick={() => dispatch(removeFromCart(cartItemId))}
            className="mt-1 cursor-pointer text-[20px] text-black/[0.5] hover:text-black md:text-[20px]"
          />
        </div>
        <div className="flex flex-row justify-between">
          {/* ------- Product Subtitle ------- */}
          <div className="block text-sm font-medium text-black/[0.5] md:text-base">
            {cartItem.subtitle}
          </div>

          {/* ------- Update Button ------- */}
          <button
            className={`mt-2 rounded bg-black p-1 px-2 text-sm text-white md:text-base ${
              showUpdateBtn ? "" : "invisible"
            }`}
            onClick={() => {
              setShowUpdateBtn(false);
              // updateCartItem();
            }}
          >
            Confirm
          </button>
        </div>

        <div className="mt-2 flex flex-row items-center justify-between md:flex-row">
          <div className="flex items-center gap-2 text-sm md:gap-10 md:text-base">
            {/* ------- Product Size ------- */}
            <div className="flex items-center gap-1">
              <div>Size:</div>
              <select
                className="rounded py-1 pl-2 text-left font-sans"
                value={selectedSize}
                onChange={(event) => {
                  setSelectedSize(event.target.value);
                  dispatch(
                    updateCart({
                      key: "selectedSize",
                      value: event.target.value,
                      id: cartItemId,
                    })
                  );
                }}
              >
                {cartItem.size.data.map((size, index) => {
                  return (
                    <option
                      // className=
                      key={index}
                      value={size.size}
                      disabled={!size.enabled}
                    >
                      {size.size}
                    </option>
                  );
                })}
              </select>
            </div>

            {/* ------- Product Quantity ------- */}
            <div className="flex items-center gap-1">
              <div>Quantity:</div>
              <select
                className="rounded py-1 pl-1 text-right font-sans"
                value={selectedQty}
                onChange={(event) => {
                  setSelectedQty(parseInt(event.target.value));
                  // setShowUpdateBtn(true);
                  dispatch(
                    updateCart({
                      key: "selectedQty",
                      value: event.target.value,
                      id: cartItemId,
                    })
                  );
                }}
              >
                {Array.from({ length: 10 }, (_, i) => i + 1).map((q, i) => {
                  return (
                    <option key={i} value={q}>
                      {q}
                    </option>
                  );
                })}
              </select>
            </div>
          </div>

          {/* ------- Product Price ------- */}
          <div className="text-sm font-medium text-black/50 md:text-lg">
            {format_price_BDT(cartItem.price * selectedQty)}
          </div>
        </div>
      </div>
    </div>
  );
};

export default CartItem;
