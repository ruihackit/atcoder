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
docker compose up -d
```

- Kill and remove the container (and its volumes) when you are done:

```bash
docker compose down -v
```

---

### How to participate in contests

- Create contest folder:

```bash
cd contest
acc new [contest-name]
cd [container-name]
```

- Edit `[contest-folder]/src/bin/[task-name].rs` to solve the problem
- Test your code:

```bash
# in /workdir/contest
../../sh/test/sh src/bin/[task-name].rs
```

---

- If you want to update `REVEL_SESSION` in container, update it in `.env` file and run:

```bash
# in container /workdir
./sh/update_revel_session.sh
```

## References

- [AtCoder でエディタからテストと提出が出来るまで](https://zennk.dev/tooyya/articles/b22a84994e131e)
