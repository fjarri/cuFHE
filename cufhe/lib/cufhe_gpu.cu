/**
 * Copyright 2013-2017 Wei Dai <wdai3141@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include <include/cufhe.h>
#include <include/details/allocator_gpu.cuh>

namespace cufhe {

uint32_t cnt = 0;

Ctxt::Ctxt(bool is_alias) {
  Param* param = GetDefaultParam();
  lwe_sample_ = new LWESample(param->lwe_n_);
  lwe_sample_deleter_ = nullptr;
  std::pair<void*, MemoryDeleter> pair;
  pair = AllocatorBoth::New(lwe_sample_->SizeMalloc());
  lwe_sample_->set_data((LWESample::PointerType)pair.first);
  lwe_sample_deleter_ = pair.second;
}

} // namespace cufhe
