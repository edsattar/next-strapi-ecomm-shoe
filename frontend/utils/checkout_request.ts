import axios, { AxiosResponse } from "axios";
import { CartType } from "@/types";

/**
 * Makes a POST request to the given Strapi API endpoint and returns the data.
 * @param {string} endpoint The endpoint to make the request to.
 * @param {CartType} payload The payload to send with the request.
 * @returns
 */
const checkout_request = async (
  endpoint: string,
  payload: CartType
): Promise<any> => {
  try {
    const response: AxiosResponse = await axios.post(
      `${process.env.NEXT_PUBLIC_STRAPI_API_URL}${endpoint}`,
      payload,
      {
        headers: {
          Authorization: `Bearer ${process.env.NEXT_PUBLIC_STRAPI_JWT}`,
          "Content-Type": "application/json",
        },
      }
    );
    return response.data;
  } catch (error) {
    // Handle any error that occurs during the request
    console.error(error);
    throw error;
  }
};

export default checkout_request;
