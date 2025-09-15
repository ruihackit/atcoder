# atcoder-rust

A library to submit solutions to AtCoder contests in `Rust`.

## Usage

- Clone this repository:

```bash
git clone --recursive https://github.com/ruihackit/atcoder-rust.git
cd atcoder-rust
```

- Copy `.env.example` to `.env`:

```bash
cp .env{.example,}
```

- Set your AtCoder session value to `REVEL_SESSION` in `.env` file.
  You can get it from browser developer tools.

- Build and run the Docker container:

```bash
docker build -t atcoder .
docker run -it --rm --name atcoder atcoder
```

- If you want to update `REVEL_SESSION` in container, update it in `.env` file and run:

```bash
./sh/update_revel_session.sh
```
