export const fetchDataFromApi = async (endpoint) => {
  const options = {
    method: "GET",
    headers: {
      Authorization: "Bearer " + process.env.NEXT_PUBLIC_STRAPI_JWT,
    },
  };

  const res = await fetch(
    `${process.env.NEXT_PUBLIC_STRAPI_API_URL}${endpoint}`,
    options
  );
  const data = await res.json();

  return data;
};

export const makePaymentRequest = async (endpoint, payload) => {
  const res = await fetch(
    `${process.env.NEXT_PUBLIC_STRAPI_API_URL}${endpoint}`,
    {
      method: "POST",
      headers: {
        Authorization: "Bearer " + process.env.NEXT_PUBLIC_STRAPI_JWT,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(payload),
    }
  );
  const data = await res.json();
  return data;
};
