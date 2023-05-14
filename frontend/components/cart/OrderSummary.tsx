import { format_price_BDT } from "@/utils";

const Order_Summary = ({ subTotal }: { subTotal: number }) => {
  return (
    <>
      <div className="text-lg font-bold">Summary</div>

      <div className="my-5 rounded-xl bg-black/[0.05] p-5">
        {/* Subtotal ---------- */}
        <div className="flex justify-between">
          <div className="text-md font-medium uppercase text-black md:text-lg">
            Subtotal
          </div>
          <div className="text-md font-medium text-black md:text-lg">
            {format_price_BDT(subTotal)}
          </div>
        </div>
        {/* ---------- Subtotal */}

        {/* Disclaimer ---------- */}
        <div className="md:text-base mt-5 border-t py-5 text-sm">
          The subtotal reflects the total price of your order, including duties
          and taxes, before any applicable discounts. It does not include
          delivery costs and international transaction fees.
        </div>
        {/* ---------- Disclaimer */}
      </div>
    </>
  );
};

export default Order_Summary;
