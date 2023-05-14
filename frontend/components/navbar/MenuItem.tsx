import Link from "next/link";
import { useState } from "react";
import { BsChevronDown } from "react-icons/bs";
import { SubMenuItemType } from "@/types";

interface Props {
  name: string;
  url?: string;
  subMenu?: SubMenuItemType[];
  setShowMobileMenu?: React.Dispatch<React.SetStateAction<boolean>>;
}

const MenuItem = ({ name, url, subMenu, setShowMobileMenu }: Props) => {
  const [showSubMenu, setShowSubMenu] = useState(false);
  return (
    <>
      {!subMenu ? (
        <Link
          className="border-b px-5 py-4 md:border-0 md:px-0"
          href={url || ""}
          onClick={() => setShowMobileMenu && setShowMobileMenu(false)}
        >
          {name}
        </Link>
      ) : (
        <div
          className="relative flex flex-col border-b px-5 py-4 md:border-0 md:px-0 md:py-0"
          onMouseLeave={() => setShowSubMenu(false)}
          onClick={() => setShowSubMenu(!showSubMenu)}
        >
          <Link href="#" onMouseEnter={() => setShowSubMenu(true)}>
            <div className="flex items-center justify-between gap-2">
              {name}
              <BsChevronDown size={14} />
            </div>
          </Link>
          {/* ----- Sub Menu ----- */}
          <div
            className={`-mx-5 -mb-4 mt-4 flex flex-col bg-black/[0.05] p-0 md:absolute md:-left-1/2 md:top-6 md:m-0 md:w-52 md:rounded-md  md:bg-white md:shadow-lg ${
              showSubMenu ? "" : "hidden"
            }`}
          >
            {subMenu.map((item) => {
              return (
                <Link
                  key={item.id}
                  href={`/category/${item.attributes.slug}`}
                  className="flex items-center justify-between border-t px-8 py-4 hover:bg-zinc-800 hover:text-white md:rounded-md md:px-2"
                  onClick={() => {
                    setShowSubMenu(false);
                    setShowMobileMenu && setShowMobileMenu(false);
                  }}
                >
                  {item.attributes.title}
                  {/* <span className="text-sm opacity-50">
                    ({subMenu.attributes.products.data.length})
                  </span> */}
                </Link>
              );
            })}
          </div>
          {/* ----- END Sub Menu ----- */}
        </div>
      )}
    </>
  );
};

export default MenuItem;
