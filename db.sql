CREATE TABLE public.user_profile (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);


INSERT INTO public.user_profile VALUES (1, 'John Doe', 'john@dow.com');