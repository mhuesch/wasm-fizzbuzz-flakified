(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (import "host" "putchar" (func $_ZN4rust7putchar17hf456db75f828c867E (type 0)))
  (func $rust_begin_unwind (type 1)
    (local i32)
    i32.const -6
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 1048582
      i32.add
      i32.load8_u
      call $_ZN4rust7putchar17hf456db75f828c867E
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      br_if 0 (;@1;)
    end
    i32.const 10
    call $_ZN4rust7putchar17hf456db75f828c867E
    loop  ;; label = @1
      br 0 (;@1;)
    end)
  (func $main (type 1)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 1
    i32.add
    local.set 1
    i32.const 0
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 0
        i32.store offset=7 align=1
        local.get 0
        i64.const 0
        i64.store
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 15
            i32.rem_u
            br_if 0 (;@4;)
            i32.const -8
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 1048590
              i32.add
              i32.load8_u
              call $_ZN4rust7putchar17hf456db75f828c867E
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          block  ;; label = @4
            local.get 2
            i32.const 5
            i32.rem_u
            br_if 0 (;@4;)
            i32.const 4
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 1048582
              i32.add
              i32.load8_u
              call $_ZN4rust7putchar17hf456db75f828c867E
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.const 8
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.rem_u
            br_if 0 (;@4;)
            i32.const -4
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 1048586
              i32.add
              i32.load8_u
              call $_ZN4rust7putchar17hf456db75f828c867E
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                i32.const 1000000000
                local.set 3
                i32.const 1
                local.set 5
                local.get 2
                local.set 6
                loop  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 6
                  local.get 6
                  local.get 3
                  i32.div_s
                  local.tee 7
                  local.get 3
                  i32.mul
                  i32.sub
                  local.set 6
                  local.get 5
                  local.get 7
                  i32.eqz
                  i32.and
                  local.set 8
                  i32.const 1
                  local.set 5
                  local.get 3
                  i32.const 10
                  i32.div_u
                  local.tee 9
                  local.set 3
                  local.get 8
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    i32.const 11
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 4
                    i32.add
                    local.get 7
                    i32.const 48
                    i32.add
                    i32.store8
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 4
                    i32.const 0
                    local.set 5
                    local.get 9
                    local.set 3
                    br 1 (;@7;)
                  end
                end
                call $_ZN4core9panicking18panic_bounds_check17h884af9d3b9389f93E
                unreachable
              end
              local.get 0
              i32.const 48
              i32.store8
              local.get 1
              local.set 6
              br 1 (;@4;)
            end
            local.get 4
            i32.const 12
            i32.ge_u
            br_if 3 (;@1;)
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            local.get 4
            i32.add
            local.set 6
          end
          local.get 0
          local.set 3
          loop  ;; label = @4
            local.get 3
            i32.load8_u
            call $_ZN4rust7putchar17hf456db75f828c867E
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 6
            i32.ne
            br_if 0 (;@4;)
          end
        end
        i32.const 10
        call $_ZN4rust7putchar17hf456db75f828c867E
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.const 100
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 0
      i32.const 16
      i32.add
      global.set 0
      return
    end
    local.get 4
    call $_ZN4core5slice5index24slice_end_index_len_fail17h8374db532e17a277E
    unreachable)
  (func $_ZN4core9panicking18panic_bounds_check17h884af9d3b9389f93E (type 1)
    call $_ZN4core9panicking9panic_fmt17h18b15be283411c65E
    unreachable)
  (func $_ZN4core5slice5index24slice_end_index_len_fail17h8374db532e17a277E (type 0) (param i32)
    local.get 0
    call $_ZN4core10intrinsics17const_eval_select17hfac1733d30cbc068E
    unreachable)
  (func $_ZN4core9panicking9panic_fmt17h18b15be283411c65E (type 1)
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core10intrinsics17const_eval_select17hfac1733d30cbc068E (type 0) (param i32)
    local.get 0
    call $_ZN4core3ops8function6FnOnce9call_once17hcb854a4b673947d7E
    unreachable)
  (func $_ZN4core3ops8function6FnOnce9call_once17hcb854a4b673947d7E (type 0) (param i32)
    local.get 0
    call $_ZN4core5slice5index27slice_end_index_len_fail_rt17h587c724f8d137324E
    unreachable)
  (func $_ZN4core5slice5index27slice_end_index_len_fail_rt17h587c724f8d137324E (type 0) (param i32)
    call $_ZN4core9panicking9panic_fmt17h18b15be283411c65E
    unreachable)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048590))
  (global (;2;) i32 (i32.const 1048592))
  (export "main" (func $main))
  (data (;0;) (i32.const 1048576) "PANIC!fizzbuzz"))
