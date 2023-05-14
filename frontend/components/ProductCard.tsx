import { get_discount_percentage } from "@/utils";
import Image from "next/image";
import Link from "next/link";
import React from "react";

import { ProductDataType } from "@/types";
import format_price_BDT from "@/utils/format_price_BDT";

interface Props {
  product: ProductDataType;
}

const ProductCard = ({ product }: Props) => {
  const { title, price, original_price, slug, thumbnail } = product.attributes;
  const thumbnail_URL = thumbnail.data.attributes.url;

  return (
    <Link
      href={`/product/${slug}`}
      className="transform overflow-hidden bg-white duration-200 hover:scale-105"
    >
      <Image width={500} height={500} src={thumbnail_URL} alt={title} />
      <div className="p-4 text-left text-black/90">
        <h2 className="h-14 text-lg font-medium">{title}</h2>

        <div className="flex items-center text-black/50">
          <p className="mr-2 text-lg font-semibold">
            {format_price_BDT(price)}
          </p>
          {original_price && (
            <>
              <p className="text-base  font-medium line-through">
                {format_price_BDT(original_price)}
              </p>
              <p className="ml-auto text-base font-medium text-green-500">
                {get_discount_percentage(original_price, price)}% off
              </p>
            </>
          )}
        </div>
      </div>
    </Link>
  );
};

export default ProductCard;
