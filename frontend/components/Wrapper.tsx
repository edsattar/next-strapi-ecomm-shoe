import { twMerge } from "tailwind-merge";

type Props = {
  children: React.ReactNode;
  className?: string;
};

const Wrapper = ({ children, className }: Props) => {
  return (
    <div className={twMerge("mx-auto w-full md:max-w-7xl max-w-lg  px-5 md:px-10", className)}>
      {children}
    </div>
  );
};

export default Wrapper;
