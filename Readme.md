# MetaCall N:N FaaS Boundary Demo

A minimal proof-of-concept for N:N cross-language function calls (Python, Node.js, Ruby) deployed via MetaCall FaaS. This serves as the foundation for GSoC 2026 cross-language fuzzing research.

## Project Structure

```text
.
├── metacall-py.json     # FaaS config
├── metacall-node.json   # FaaS config
├── metacall-rb.json     # FaaS config
├── caller.py            # Py caller → calls JS + Ruby
├── caller.js            # JS caller → calls Py + Ruby
├── caller.rb            # Rb caller → calls Py + JS
├── functions.py         # Py target functions
├── functions.js         # JS target functions
└── functions.rb         # Rb target functions
```

## 1. Package & Deploy

Run these commands while the MetaCall FaaS server is running locally on port `9000`:

```bash
# Clean and package
rm -f deploy.zip
zip deploy.zip *.py *.js *.rb *.json

# Upload package
curl -X POST http://localhost:9000/api/package/create \
  -F "id=nndemo" \
  -F "file=@deploy.zip;type=application/zip"

# Deploy
curl -X POST http://localhost:9000/api/deploy/create \
  -H "Content-Type: application/json" \
  -d '{"suffix": "nndemo", "env": [], "version": "v1"}'
```

## 2. Test the Cross-Language Boundaries

Once deployed, hit the REST endpoints to trigger the N:N call chains.

**Trigger JavaScript (Calls Python & Ruby):**
```bash
curl -X POST http://localhost:9000/Prathams-MacBook-Air.local/nndemo/v1/call/run_js_caller \
  -H "Content-Type: application/json" -d '{}'
```

**Trigger Python (Calls JS & Ruby):**
```bash
curl -X POST http://localhost:9000/Prathams-MacBook-Air.local/nndemo/v1/call/run_py_caller \
  -H "Content-Type: application/json" -d '{}'
```

**Trigger Ruby (Calls Python & JS):**
```bash
curl -X POST http://localhost:9000/Prathams-MacBook-Air.local/nndemo/v1/call/run_rb_caller \
  -H "Content-Type: application/json" -d '{}'
```