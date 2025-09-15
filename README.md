```bash
cp .env{.example,}
```

- Set your AtCoder session value to `REVEL_SESSION` in `.env` file.
  You can get it from browser developer tools.

```bash
docker build -t atcoder .
docker run -it --rm --name atcoder atcoder
```

- Run the following command to update `REVEL_SESSION` in config files.

- If you want to update `REVEL_SESSION`, update it in `.env` file and run:

```bash
./sh/update_revel_session.sh
```
