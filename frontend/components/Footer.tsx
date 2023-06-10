import Link from "next/link";
import { FaFacebookF, FaTwitter, FaYoutube, FaInstagram } from "react-icons/fa";
import Wrapper from "./Wrapper";

const menuLeft = [
  { id: 1, name: "Find a store", url: "#" },
  { id: 2, name: "Become a partner", url: "#" },
  { id: 3, name: "Sign up for email", url: "#" },
  { id: 4, name: "Send us feedback", url: "#" },
  { id: 5, name: "Student discount", url: "#" },
];

const menuGetHelp = [
  { id: 1, name: "Order Status", url: "#" },
  { id: 2, name: "Delivery", url: "#" },
  { id: 3, name: "Returns", url: "#" },
  { id: 4, name: "Payment Options", url: "#" },
  { id: 5, name: "Contact Us", url: "#" },
];

const menuAbout = [
  { id: 1, name: "Careers", url: "#" },
  { id: 2, name: "News", url: "#" },
  { id: 3, name: "Investors", url: "#" },
  { id: 4, name: "Sustainability", url: "#" },
];

const menuSocial = [
  { id: 1, name: "Facebook", url: "#", icon: <FaFacebookF size={20} /> },
  { id: 2, name: "Twitter", url: "#", icon: <FaTwitter size={20} /> },
  { id: 3, name: "Youtube", url: "#", icon: <FaYoutube size={20} /> },
  { id: 4, name: "Instagram", url: "#", icon: <FaInstagram size={20} /> },
];

const menuBottom = [
  { id: 1, name: "Terms of Sale", url: "#" },
  { id: 2, name: "Terms of Use", url: "#" },
  { id: 3, name: "Privacy Policy", url: "#" },
];

const Footer = () => {
  return (
    <footer className="bg-black pb-3 pt-14 text-white">
      <Wrapper className="flex flex-col justify-between gap-[50px] md:flex-row md:gap-0">
        {/* LEFT START */}
        <div className="flex flex-col gap-[50px] m-auto sm:flex-row md:flex-row md:gap-[75px] lg:gap-[100px]">
          {/* MENU START */}
          <div className="flex shrink-0 flex-col gap-3">
            {menuLeft.map((item) => (
              <Link
                key={item.id}
                href={item.url || "#"}
                className="font-oswald cursor-pointer text-sm font-medium uppercase"
              >
                {item.name}
              </Link>
            ))}
          </div>
          {/* MENU END */}

          <div className="flex shrink-0 gap-[50px] md:gap-[75px] lg:gap-[100px]">
            {/* HELP */}
            <div className="flex flex-col gap-3">
              <div className="font-oswald text-sm font-medium uppercase">
                get help
              </div>
              {menuGetHelp.map((item) => (
                <Link
                  href={item.url}
                  key={item.id}
                  className="cursor-pointer text-sm text-white/[0.5] hover:text-white"
                >
                  {item.name}
                </Link>
              ))}
            </div>
            {/* END HELP */}

            {/* ABOUT */}
            <div className="flex flex-col gap-3">
              <div className="font-oswald text-sm font-medium uppercase">
                About nike
              </div>
              {menuAbout.map((item) => (
                <Link
                  key={item.id}
                  href={item.url}
                  className="cursor-pointer text-sm text-white/[0.5] hover:text-white"
                >
                  {item.name}
                </Link>
              ))}
            </div>
            {/* END ABOUT */}
          </div>
        </div>
        {/* LEFT END */}

        {/* SOCIAL */}
        <div className="flex justify-center gap-4 md:justify-start">
          {menuSocial.map((item) => (
            <Link
              key={item.id}
              href={item.url}
              className="flex h-10 w-10 cursor-pointer items-center justify-center rounded-full bg-white/[0.25] text-black hover:bg-white/[0.5]"
            >
              {item.icon}
            </Link>
          ))}
        </div>
        {/* END SOCIAL */}
      </Wrapper>
      <Wrapper className="mt-10 flex flex-col justify-between gap-[10px] md:flex-row md:gap-0">
        {/* BOTTOM */}
        <div className="cursor-pointer text-center text-[12px] text-white/[0.5] hover:text-white md:text-left">
          © 2023 Nike, Inc. All Rights Reserved
        </div>

        <div className="flex flex-wrap justify-center gap-2 text-center md:gap-5 md:text-left">
          {menuBottom.map((item) => (
            <Link
              key={item.id}
              href={item.url}
              className="cursor-pointer text-[12px] text-white/[0.5] hover:text-white"
            >
              {item.name}
            </Link>
          ))}
        </div>
        {/* END BOTTOM */}
      </Wrapper>
    </footer>
  );
};

export default Footer;
