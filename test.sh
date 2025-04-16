#!/bin/bash
if [ -f "index.html" ]; then
  echo "✅ Test Passed: index.html found"
  exit 0
else
  echo "❌ Test Failed: index.html missing"
  exit 1
fi