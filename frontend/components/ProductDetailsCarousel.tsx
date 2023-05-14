import "react-responsive-carousel/lib/styles/carousel.min.css"; // requires a loader
import { Carousel } from "react-responsive-carousel";
import { ImagesType } from "@/types";

const ProductDetailsCarousel = ({ images }: { images: ImagesType }) => {
  return (
    <div className="sticky top-[50px] mx-auto w-full max-w-[1360px] text-[20px] text-white">
      <Carousel
        infiniteLoop={true}
        showIndicators={false}
        showStatus={false}
        thumbWidth={60}
        className="productCarousel"
      >
        {images.data.map((image) => (
          <img key={image.id} src={image.attributes.url} alt={image.attributes.name}/>
        ))}
      </Carousel>
    </div>
  );
};

export default ProductDetailsCarousel;
