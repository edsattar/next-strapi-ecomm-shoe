import { IconType } from "react-icons";

interface Props {
  icon: IconType;
  count?: number;
}

const BadgedIcon = ({ icon: Icon, count = 0 }: Props) => {
  return (
    <div className="relative flex h-8 w-8 cursor-pointer items-center justify-center rounded-full hover:bg-black/[0.05] md:h-12 md:w-12">
      <Icon className="text-xl md:text-2xl" />
      {count > 0 && (
        <div className="min-w-[16px] md:min-w-[20px] absolute left-5 top-0 flex h-4 items-center justify-center rounded-full bg-red-600 px-[5px] text-[10px] text-white md:left-7 md:top-1 md:h-5 md:px-1.5 md:text-xs">
          {count}
        </div>
      )}
    </div>
  );
};

export default BadgedIcon;
