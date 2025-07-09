name: "Base PRP Template v2 - Context-Rich with Validation Loops"
description: |

## Purpose
Template optimized for AI agents to implement features with sufficient context and self-validation capabilities to achieve working code through iterative refinement.

## Core Principles
1. **Context is King**: Include ALL necessary documentation, examples, and caveats
2. **Current Documentation Required**: ALWAYS search for latest documentation to avoid deprecated features
3. **Validation Loops**: Provide executable tests/lints the AI can run and fix
4. **Information Dense**: Use keywords and patterns from the codebase
5. **Progressive Success**: Start simple, validate, then enhance
6. **Global rules**: Be sure to follow all rules in CLAUDE.md

## ⚠️ MANDATORY RESEARCH PHASE
Before implementation, the AI agent MUST:
1. **WebSearch for latest documentation** of all frameworks/libraries
2. **Check for deprecation warnings** and breaking changes
3. **Verify current configuration syntax** and template functions
4. **Research common gotchas** and troubleshooting guides
5. **Confirm security requirements** and best practices

**Search Template**: Use these exact search patterns:
- `"[Framework] [version] documentation [feature] 2024"`
- `"[Framework] deprecated features breaking changes migration"`
- `"[Framework] common errors troubleshooting build issues"`
- `"[Framework] security configuration requirements"`

---

## Goal
[What needs to be built - be specific about the end state and desires]

## Why
- [Business value and user impact]
- [Integration with existing features]
- [Problems this solves and for whom]

## What
[User-visible behavior and technical requirements]

### Success Criteria
- [ ] [Specific measurable outcomes]

## All Needed Context

### Documentation & References (list all context needed to implement the feature)
```yaml
# CRITICAL: Always get LATEST documentation to avoid deprecated features
# Use WebSearch for current documentation before implementation

# MUST READ - Include these in your context window
- url: [Official API docs URL - SEARCH FOR LATEST VERSION]
  why: [Specific sections/methods you'll need]
  search_terms: "[Framework name] [version] documentation [specific feature] 2024"
  
- file: [path/to/example.py]
  why: [Pattern to follow, gotchas to avoid]
  
- doc: [Library documentation URL] 
  section: [Specific section about common pitfalls]
  critical: [Key insight that prevents common errors]
  
- search_latest: "WebSearch: [Framework] latest version breaking changes deprecation 2024"
  why: "Avoid deprecated features and config options"

- search_gotchas: "WebSearch: [Framework] common errors troubleshooting build issues 2024"
  why: "Learn from others' recent experiences"

- docfile: [PRPs/ai_docs/file.md]
  why: [docs that the user has pasted in to the project]

# MANDATORY: Research current best practices
- research_required:
  - "Latest stable version of [Framework/Library]"
  - "Recent breaking changes and migrations"
  - "Current configuration format (not deprecated)"
  - "Latest template syntax and functions"
  - "Security considerations and recommendations"

```

### Current Codebase tree (run `tree` in the root of the project) to get an overview of the codebase
```bash

```

### Desired Codebase tree with files to be added and responsibility of file
```bash

```

### Known Gotchas of our codebase & Library Quirks
```yaml
# CRITICAL: Research and document ALL framework-specific requirements
# Use WebSearch to find latest gotchas and breaking changes

Framework_Version_Check:
  - current_version: "[Check package.json, requirements.txt, etc.]"
  - latest_version: "[Search for latest stable version]"
  - breaking_changes: "[Search for migration guides between versions]"

Configuration_Gotchas:
  # CRITICAL: [Library name] requires [specific setup]
  # Example: Hugo v0.128+ changed paginate to pagination.pagerSize
  # Example: Hugo template functions changed from .Site.GoogleAnalytics to site.GoogleAnalytics
  # Example: Security config requires explicit allowlist for executables
  - config_format: "[Document current vs deprecated config]"
  - template_syntax: "[Check for function/variable changes]"
  - security_requirements: "[List required security configurations]"

Library_Quirks:
  # Example: FastAPI requires async functions for endpoints
  # Example: This ORM doesn't support batch inserts over 1000 records
  # Example: We use pydantic v2 and field_validator instead of validator
  - async_requirements: "[Which functions must be async]"
  - data_limitations: "[Size limits, batch restrictions]"
  - syntax_changes: "[Old vs new syntax patterns]"

Build_Process_Gotchas:
  # Example: Hugo requires specific directory structure
  # Example: CSS build must happen before Hugo build
  # Example: Git repository required for certain Hugo features
  - build_order: "[Required sequence of build steps]"
  - directory_requirements: "[Required folder structure]"
  - dependencies: "[External tool requirements]"

Search_Terms_For_Issues:
  - "[Framework] [version] common errors troubleshooting"
  - "[Framework] deprecated features migration guide"
  - "[Framework] security configuration requirements"
  - "[Framework] build process gotchas"
```

## Implementation Blueprint

### Data models and structure

Create the core data models, we ensure type safety and consistency.
```python
Examples: 
 - orm models
 - pydantic models
 - pydantic schemas
 - pydantic validators

```

### list of tasks to be completed to fullfill the PRP in the order they should be completed

```yaml
Task 1:
MODIFY src/existing_module.py:
  - FIND pattern: "class OldImplementation"
  - INJECT after line containing "def __init__"
  - PRESERVE existing method signatures

CREATE src/new_feature.py:
  - MIRROR pattern from: src/similar_feature.py
  - MODIFY class name and core logic
  - KEEP error handling pattern identical

...(...)

Task N:
...

```


### Per task pseudocode as needed added to each task
```python

# Task 1
# Pseudocode with CRITICAL details dont write entire code
async def new_feature(param: str) -> Result:
    # PATTERN: Always validate input first (see src/validators.py)
    validated = validate_input(param)  # raises ValidationError
    
    # GOTCHA: This library requires connection pooling
    async with get_connection() as conn:  # see src/db/pool.py
        # PATTERN: Use existing retry decorator
        @retry(attempts=3, backoff=exponential)
        async def _inner():
            # CRITICAL: API returns 429 if >10 req/sec
            await rate_limiter.acquire()
            return await external_api.call(validated)
        
        result = await _inner()
    
    # PATTERN: Standardized response format
    return format_response(result)  # see src/utils/responses.py
```

### Integration Points
```yaml
DATABASE:
  - migration: "Add column 'feature_enabled' to users table"
  - index: "CREATE INDEX idx_feature_lookup ON users(feature_id)"
  
CONFIG:
  - add to: config/settings.py
  - pattern: "FEATURE_TIMEOUT = int(os.getenv('FEATURE_TIMEOUT', '30'))"
  
ROUTES:
  - add to: src/api/routes.py  
  - pattern: "router.include_router(feature_router, prefix='/feature')"
```

## Validation Loop

### Level 0: Framework Version & Configuration Check
```bash
# MANDATORY: Run these BEFORE any implementation
# Check for deprecated configuration and breaking changes

# For Hugo projects:
hugo version                         # Verify Hugo version
hugo config                         # Check configuration syntax
hugo --printPathWarnings            # Check for path issues

# For Node.js projects:
npm audit                           # Check for vulnerabilities
npm outdated                        # Check for outdated packages

# For Python projects:
pip check                           # Check for dependency conflicts
python -m mypy --version            # Verify tool versions

# Framework-specific validation:
[framework_command] --validate-config   # If available
[framework_command] --dry-run           # Test without execution

# Expected: No deprecation warnings, all tools current version
# If warnings: UPDATE configuration before proceeding
```

### Level 1: Syntax & Style
```bash
# Run these FIRST - fix any errors before proceeding
ruff check src/new_feature.py --fix  # Auto-fix what's possible
mypy src/new_feature.py              # Type checking

# Expected: No errors. If errors, READ the error and fix.
```

### Level 2: Unit Tests each new feature/file/function use existing test patterns
```python
# CREATE test_new_feature.py with these test cases:
def test_happy_path():
    """Basic functionality works"""
    result = new_feature("valid_input")
    assert result.status == "success"

def test_validation_error():
    """Invalid input raises ValidationError"""
    with pytest.raises(ValidationError):
        new_feature("")

def test_external_api_timeout():
    """Handles timeouts gracefully"""
    with mock.patch('external_api.call', side_effect=TimeoutError):
        result = new_feature("valid")
        assert result.status == "error"
        assert "timeout" in result.message
```

```bash
# Run and iterate until passing:
uv run pytest test_new_feature.py -v
# If failing: Read error, understand root cause, fix code, re-run (never mock to pass)
```

### Level 3: Integration Test
```bash
# Start the service
uv run python -m src.main --dev

# Test the endpoint
curl -X POST http://localhost:8000/feature \
  -H "Content-Type: application/json" \
  -d '{"param": "test_value"}'

# Expected: {"status": "success", "data": {...}}
# If error: Check logs at logs/app.log for stack trace
```

## Final validation Checklist

### Framework & Configuration Validation
- [ ] Latest documentation researched and applied
- [ ] No deprecated configuration options used
- [ ] Framework version compatibility confirmed
- [ ] All deprecation warnings resolved
- [ ] Security configuration properly set

### Build & Runtime Validation  
- [ ] Clean build from scratch: `[build_command]`
- [ ] No build warnings or errors
- [ ] Development server starts successfully
- [ ] All routes/pages accessible
- [ ] Asset loading works correctly (CSS, JS, images)

### Code Quality Validation
- [ ] All tests pass: `uv run pytest tests/ -v`
- [ ] No linting errors: `uv run ruff check src/`
- [ ] No type errors: `uv run mypy src/`
- [ ] Manual test successful: [specific curl/command]
- [ ] Error cases handled gracefully
- [ ] Logs are informative but not verbose

### Framework-Specific Validation
- [ ] Configuration syntax matches current version
- [ ] Template functions use current syntax
- [ ] Required dependencies properly configured
- [ ] File structure follows framework conventions
- [ ] Performance optimizations applied

### Deployment Readiness
- [ ] Production build succeeds
- [ ] Environment variables documented
- [ ] Deployment configuration tested
- [ ] Documentation updated with current patterns
- [ ] README includes troubleshooting for common issues

---

## Anti-Patterns to Avoid

### Documentation & Research Anti-Patterns
- ❌ **Don't use outdated documentation** - Always search for current version docs
- ❌ **Don't ignore deprecation warnings** - Update to current syntax immediately  
- ❌ **Don't assume config syntax is stable** - Check for breaking changes between versions
- ❌ **Don't skip framework-specific research** - Each framework has unique gotchas

### Configuration Anti-Patterns  
- ❌ **Don't use deprecated config options** (e.g., `paginate` vs `pagination.pagerSize`)
- ❌ **Don't use old template syntax** (e.g., `.Site.GoogleAnalytics` vs `site.GoogleAnalytics`)
- ❌ **Don't ignore security configuration** - Explicitly configure security settings
- ❌ **Don't assume defaults work** - Many frameworks require explicit configuration

### Build Process Anti-Patterns
- ❌ **Don't skip build order requirements** - Some builds must happen in sequence
- ❌ **Don't ignore directory structure** - Many frameworks require specific layouts
- ❌ **Don't assume Git is optional** - Some features require Git repository
- ❌ **Don't skip clean builds** - Always test from clean state

### General Anti-Patterns
- ❌ Don't create new patterns when existing ones work
- ❌ Don't skip validation because "it should work"  
- ❌ Don't ignore failing tests - fix them
- ❌ Don't use sync functions in async context
- ❌ Don't hardcode values that should be config
- ❌ Don't catch all exceptions - be specific

### Framework Version Anti-Patterns
- ❌ **Don't assume backwards compatibility** - Check migration guides
- ❌ **Don't mix old and new syntax** - Be consistent with version requirements  
- ❌ **Don't ignore version constraints** - Respect minimum/maximum version requirements
- ❌ **Don't skip security updates** - Always use secure, supported versions

---

## Confidence Scoring (Rate 1-10 for one-pass implementation success)

### Research & Documentation Score (0-3 points)
- [ ] Latest official documentation researched (+1)
- [ ] Deprecation warnings and breaking changes identified (+1) 
- [ ] Framework-specific gotchas and troubleshooting guides reviewed (+1)

### Context & Examples Score (0-2 points)
- [ ] Existing codebase patterns identified and documented (+1)
- [ ] Similar implementations found and referenced (+1)

### Validation & Testing Score (0-3 points)
- [ ] All validation commands are executable and current (+1)
- [ ] Framework-specific validation steps included (+1)
- [ ] Integration testing approach defined (+1)

### Implementation Clarity Score (0-2 points)
- [ ] Step-by-step tasks are specific and actionable (+1)
- [ ] Integration points clearly documented (+1)

**Total Score: ___/10**

### Confidence Guidelines:
- **8-10**: High confidence for one-pass implementation
- **6-7**: Moderate confidence, may need some iteration  
- **4-5**: Low confidence, significant research gaps remain
- **0-3**: Poor preparation, major context missing

### Required Score for Execution:
- Minimum score of **7/10** required before starting implementation
- If score < 7, additional research and documentation needed