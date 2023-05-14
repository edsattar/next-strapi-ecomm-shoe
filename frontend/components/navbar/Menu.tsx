import MenuItem from "@/components/navbar/MenuItem";

import { SubMenuItemType } from "@/types";

interface Props {
  menuItems: {
    id: number;
    name: string;
    url?: string;
    subMenu?: SubMenuItemType[];
  }[];
}

const Menu = ({ menuItems }: Props) => {
  return (
    <ul className="hidden items-center gap-8 font-medium text-black md:flex">
      {menuItems.map((item) => (
        <li key={item.id}>
          <MenuItem {...item} />
        </li>
      ))}
    </ul>
  );
};

export default Menu;
