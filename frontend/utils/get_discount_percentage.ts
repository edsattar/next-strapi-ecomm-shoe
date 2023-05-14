const get_discount_percentage = (
  originalPrice: number,
  discountedPrice: number
) => {
  const discountPercentage =
    ((originalPrice - discountedPrice) / originalPrice) * 100;

  return discountPercentage.toFixed(0);
};

export default get_discount_percentage;