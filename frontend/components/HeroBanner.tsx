import React from "react";
import Image from "next/image";
import slide1 from "@/public/slide-1.png";
import slide2 from "@/public/slide-2.png";
import slide3 from "@/public/slide-3.png";

import "react-responsive-carousel/lib/styles/carousel.min.css"; // requires a loader
import { Carousel } from "react-responsive-carousel";

import { BiArrowBack } from "react-icons/bi";
import { Oswald } from "next/font/google";

const oswald = Oswald({ subsets: ["latin"] });

const slides = [
  { id: 1, src: slide1, alt: "Slide 1", title: "Shop now" },
  { id: 2, src: slide2, alt: "Slide 2", title: "Shop now" },
  { id: 3, src: slide3, alt: "Slide 3", title: "Shop now" },
];

const HeroBanner = () => {
  return (
    <div className="relative mx-auto w-full max-w-[1360px] text-xl text-white">
      <Carousel
        autoPlay={true}
        infiniteLoop={true}
        interval={4000}
        showThumbs={false}
        showIndicators={false}
        showStatus={false}
        renderArrowPrev={(clickHandler, hasPrev) => (
          <div
            onClick={clickHandler}
            className="absolute bottom-0 right-[31px] z-10 flex h-[30px] w-[30px] cursor-pointer items-center justify-center bg-black hover:opacity-90 md:right-[51px] md:h-[50px] md:w-[50px]"
          >
            <BiArrowBack className="text-sm md:text-lg" />
          </div>
        )}
        renderArrowNext={(clickHandler, hasNext) => (
          <div
            onClick={clickHandler}
            className="absolute bottom-0 right-0 z-10 flex h-[30px] w-[30px] cursor-pointer items-center justify-center bg-black hover:opacity-90 md:h-[50px] md:w-[50px]"
          >
            <BiArrowBack className="rotate-180 text-sm md:text-lg" />
          </div>
        )}
      >
        {slides.map((slide) => (
          <div key={slide.id}>
            <Image src={slide.src} alt={slide.alt} priority />
            <div
              className={`${oswald.className} absolute bottom-[25px] left-0 cursor-pointer bg-white px-[15px] py-[10px] text-[15px] font-medium uppercase text-black/[0.9] hover:opacity-90 md:bottom-[75px] md:px-[40px] md:py-[25px] md:text-[30px]`}
            >
              {slide.title}
            </div>
          </div>
        ))}
      </Carousel>
    </div>
  );
};

export default HeroBanner;
