import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import { MenuItemType } from "@/types";

import { Footer, Wrapper, Navbar } from "@/components";

import { Urbanist } from "next/font/google";
const urbanist = Urbanist({ subsets: ["latin"] });

interface Props {
  navbarMenuItems?: MenuItemType[];
  children: React.ReactNode;
}

const Layout = ({ navbarMenuItems={}, children }: Props) => {
  return (
    <main className={urbanist.className}>
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
        <Navbar menuItems={navbarMenuItems} />
        {children}
      </Wrapper>
      <Footer />
    </main>
  );
};

export default Layout;
