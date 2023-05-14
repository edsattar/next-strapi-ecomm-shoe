import Link from "next/link";
import Image from "next/image";

const EmptyCart = () => {
  return (
    <div className="flex flex-[2] flex-col items-center pb-[50px] md:-mt-14">
      <Image
        alt="Empty Cart"
        src="/empty-cart.jpg"
        width={300}
        height={300}
        className="w-[300px] md:w-[400px]"
      />
      <span className="text-xl font-bold">Your cart is empty</span>
      <span className="mt-4 text-center">
        Looks like you have not added anything in your cart.
        <br />
        Go ahead and explore top categories.
      </span>
      <Link
        href="/"
        className="mb-3 mt-8 rounded-full bg-black px-8 py-4 text-lg font-medium text-white transition-transform hover:opacity-75 active:scale-95"
      >
        Continue Shopping
      </Link>
    </div>
  );
};

export default EmptyCart;
