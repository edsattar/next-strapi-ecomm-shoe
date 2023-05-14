const format_price_BDT = (price: number) => {
  const options = {
    maximumFractionDigits: 0,
  };
  const formattedPrice = price.toLocaleString("en-IN", options);
  return "৳ " + formattedPrice.replace(/,/g, " ");
};

export default format_price_BDT;
