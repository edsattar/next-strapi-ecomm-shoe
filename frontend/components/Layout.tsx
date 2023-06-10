import { twMerge } from "tailwind-merge";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import { MenuItemType } from "@/types";

import { Footer, Wrapper, Navbar } from "@/components";

import { Urbanist } from "next/font/google";
const font = Urbanist({ subsets: ["latin"] });

interface Props {
  navbarMenuItems: MenuItemType[];
  children: React.ReactNode;
}

const Layout = ({ navbarMenuItems, children }: Props) => {
  return (
    <main className={twMerge("min-w-full", font.className)}>
      <Navbar menuItems={navbarMenuItems} />
      <Wrapper>
        <ToastContainer
          position="bottom-right"
          autoClose={1500}
          hideProgressBar={false}
          newestOnTop={false}
          closeOnClick
          rtl={false}
          pauseOnFocusLoss
          draggable
          pauseOnHover
          theme="dark"
        />
        {children}
      </Wrapper>
      <Footer />
    </main>
  );
};

export default Layout;
