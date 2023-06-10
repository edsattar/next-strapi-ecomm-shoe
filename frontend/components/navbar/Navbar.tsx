import React, { useState, useEffect, useCallback } from "react";
import { useSelector } from "react-redux";
import { IoMdHeartEmpty } from "react-icons/io";
import { BsCart } from "react-icons/bs";

import Link from "next/link";
import Image from "next/image";
import logo from "@/public/logo.svg";
import Menu from "./Menu";
import MenuMobile from "./MenuMobile";
import BadgedIcon from "./BadgedIcon";
import { RootState } from "@/store/store";
import { MenuItemType } from "@/types";

interface Props {
  menuItems: MenuItemType[];
}

const Navbar = ({ menuItems }: Props) => {
  const [show, setShow] = useState("translate-y-0");
  const [lastScrollY, setLastScrollY] = useState(0);
  const { cartItems } = useSelector((state: RootState) => state.cart);

  const controlNavbar = useCallback(() => {
    if (window.scrollY > lastScrollY && window.scrollY > 200) {
      setShow("-translate-y-full");
    } else {
      setShow("translate-y-0");
    }
    setLastScrollY(window.scrollY);
  }, [lastScrollY]);

  useEffect(() => {
    window.addEventListener("scroll", controlNavbar);
    return () => {
      window.removeEventListener("scroll", controlNavbar);
    };
  }, [controlNavbar]);

  return (
    <div
      className={`font-urbanist sticky top-0 z-20 flex h-12 w-full items-center justify-between bg-white transition-transform duration-300 md:h-20 ${show}`}
    >
      <div className="mx-auto flex w-full max-w-7xl items-center justify-between px-5 md:px-10">
        <Link href="/">
          <Image src={logo} alt="logo" className="w-10 md:w-16" />
        </Link>
        <Menu menuItems={menuItems} />

        {/*----- Icon Area -----*/}
        <div className="flex items-center gap-2 text-black">
          {/*----- Favorite Icon -----*/}
          <BadgedIcon icon={IoMdHeartEmpty} count={0} />

          {/*----- Cart Icon -----*/}
          <Link href="/cart">
            <BadgedIcon icon={BsCart} count={cartItems.length} />
          </Link>

          <MenuMobile menuItems={menuItems} />
        </div>
        {/*----- END Icon Area -----*/}
      </div>
    </div>
  );
};

export default Navbar;
