import MenuItem from "@/components/navbar/MenuItem";
import { MenuItemType } from "@/types";
import { useState } from "react";
import { BiMenuAltRight } from "react-icons/bi";
import { VscChromeClose } from "react-icons/vsc";

interface Props {
  menuItems: MenuItemType[];
}

const MobileMenu = ({ menuItems }: Props) => {
  const [showMobileMenu, setShowMobileMenu] = useState(false);
  return (
    <>
      <div className="relative -mr-2 flex h-8 w-8 cursor-pointer items-center justify-center rounded-full hover:bg-black/5 md:hidden md:h-12 md:w-12">
        {showMobileMenu ? (
          <VscChromeClose
            className="text-base"
            onClick={() => setShowMobileMenu(false)}
          />
        ) : (
          <BiMenuAltRight
            className="text-xl"
            onClick={() => setShowMobileMenu(true)}
          />
        )}
      </div>
      <ul
        className={`${
          showMobileMenu ? "" : "hidden"
        } absolute left-0 top-12 flex h-[calc(100vh-50px)] w-full flex-col border-t bg-white font-bold text-black md:hidden`}
      >
        {menuItems.map((item) => {
          return (
            <MenuItem
              key={item.id}
              {...item}
              setShowMobileMenu={setShowMobileMenu}
            />
          );
        })}
      </ul>
    </>
  );
};

export default MobileMenu;
