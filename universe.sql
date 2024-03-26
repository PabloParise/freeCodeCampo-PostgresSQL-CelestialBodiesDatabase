--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    name character varying(20) NOT NULL,
    blackhole_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    spiral boolean,
    distance_from_milky_way integer,
    will_colide_with_us boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    was_visited_by_humans boolean,
    composition character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    moons integer,
    radius numeric(6,1),
    description text,
    supports_life boolean,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planets integer,
    galaxy_id integer NOT NULL,
    type character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES ('Sagittarius A*', 1, 1);
INSERT INTO public.blackhole VALUES ('Andromeda A*', 2, 2);
INSERT INTO public.blackhole VALUES ('Black Eye A*', 3, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, NULL, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Io', 2, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', 3, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 4, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Callisto', 5, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Mimas', 6, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 7, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Tethys', 8, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Dione', 9, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Rhea', 10, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Titan', 11, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 12, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Miranda', 13, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Ariel', 14, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Umbriel', 15, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Titania', 16, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Oberon', 17, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Triton', 18, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('Nereid', 19, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('Charon', 21, 9, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 0, 2439.7, 'Mercury is the smallest planet in the Solar System.', false, 7, 1);
INSERT INTO public.planet VALUES ('Venus', 0, 6051.8, 'Venus is the second planet from the Sun and the hottest in the Solar System.', false, 7, 2);
INSERT INTO public.planet VALUES ('Earth', 1, 6371.0, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', true, 7, 3);
INSERT INTO public.planet VALUES ('Mars', 2, 3389.5, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System.', true, 7, 4);
INSERT INTO public.planet VALUES ('Jupiter', 79, 69911.0, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.', false, 7, 5);
INSERT INTO public.planet VALUES ('Saturn', 82, 58232.0, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System.', false, 7, 6);
INSERT INTO public.planet VALUES ('Uranus', 27, 25362.0, 'Uranus is the seventh planet from the Sun.', false, 7, 7);
INSERT INTO public.planet VALUES ('Neptune', 14, 24622.0, 'Neptune is the eighth and farthest-known Solar planet from the Sun.', false, 7, 8);
INSERT INTO public.planet VALUES ('Alpha Centauri b', 0, 7000.3, 'Alpha Centauri b is a potentially habitable exoplanet orbiting the star Alpha Centauri A.', true, 3, 9);
INSERT INTO public.planet VALUES ('Alpha Centauri c', 0, 10560.5, 'Alpha Centauri c is an exoplanet orbiting the star Alpha Centauri A.', false, 3, 10);
INSERT INTO public.planet VALUES ('Alpha Centauri d', 2, 8600.2, 'Alpha Centauri d is an exoplanet orbiting the star Alpha Centauri B.', false, 3, 11);
INSERT INTO public.planet VALUES ('Alpha Centauri e', 1, 11000.7, 'Alpha Centauri e is an exoplanet orbiting the star Alpha Centauri C.', false, 3, 12);
INSERT INTO public.planet VALUES ('Pluto', 5, 1188.3, 'Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune. It is the largest known member of the Kuiper belt.', false, 7, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 5, 1, 'White supergiant');
INSERT INTO public.star VALUES (2, 'Sirius', 4, 1, 'Binary');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5, 1, 'System');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 7, 1, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Rigel', 4, 1, 'System');
INSERT INTO public.star VALUES (6, 'Vega', 5, 1, 'White dwarf');
INSERT INTO public.star VALUES (7, 'Sun', 8, 1, 'Yellow dwarf');


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: blackhole unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: blackhole fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

