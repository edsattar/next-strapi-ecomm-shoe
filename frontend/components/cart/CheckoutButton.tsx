import React from "react";

interface Props {
  loading: boolean;
  onClick: () => void;
}

const Checkout_Button = ({ loading, onClick }: Props) => {
  return (
    <button
      className="mb-3 flex w-full items-center justify-center gap-2 rounded-full bg-black py-4 text-lg font-medium text-white transition-transform hover:opacity-75 active:scale-95"
      onClick={onClick}
    >
      Checkout
      {loading && <img src="/spinner.svg" />}
    </button>
  );
};

export default Checkout_Button;
