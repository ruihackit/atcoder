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
docker build -t atcoder-rust .
docker run -it --rm --name atcoder-rust atcoder-rust bash
```

- If you have `tmux` installed, you can run the container in a new `tmux` session:

```bash
tmux new-session -s atcoder-rust -d 'docker run -it --rm --name atcoder-rust atcoder-rust bash'
```

```bash
# In container
cd /workdir && code -r .
```

---

- If you want to update `REVEL_SESSION` in container, update it in `.env` file and run:

```bash
./sh/update_revel_session.sh
```

## References

- [AtCoder でエディタからテストと提出が出来るまで](https://zenn.dev/tooyya/articles/b22a84994e131e)
