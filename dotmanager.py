#!/usr/bin/env python3
import os
from typing import Tuple
from pathlib import Path
from argparse import ArgumentParser
import shutil
from inspect import getsourcefile

def fill_eq(f1, f2) -> bool:
    # Check if they are dirs
    if os.path.isdir(f1) and os.path.isdir(f2): return True
    if os.path.isdir(f1) or  os.path.isdir(f2): return False
    # Check that both exist
    if not os.path.exists(f1) or not os.path.exists(f2): return False
    # Check their contents
    with open(f1, "rb") as file1:
        with open(f2, "rb") as file2:
            b1 = file1.read()
            b2 = file2.read()
    return b1 == b2

def get_tracked(root:str) -> Tuple[str,str]:
    def get_pair(s,p):
        return os.path.join(os.path.expanduser("~"),s[len(root)+1:],p), \
        os.path.join(s,p)
    for r,ds,fs in os.walk(root):
        for f in fs:
            yield get_pair(r,f)
        for d in ds:
            yield get_pair(r,d)

def main():
    # Parse arguments
    args = ArgumentParser(prog="DotManager",description="Helps manages dotfiles")
    # Arguments for default mode
    args.add_argument("--dry",action="store_true")
    args.add_argument("--copy-missing",action="store_true")
    args.add_argument("--copy-different",action="store_true")
    args.add_argument("--update-different",action="store_true")
    args.add_argument("--ask-different",action="store_true")
    # Arguments for other modes
    args.add_argument("--add",default=None)
    # Parse arguments
    args = args.parse_args()

    f_path = Path(os.path.dirname(getsourcefile(lambda:0)),"home")

    # Check if add file mode
    if not args.add is None:
        dst = Path(f_path,os.path.relpath(args.add, os.path.expanduser("~")))
        src = Path(args.add.strip())
        Path(os.path.dirname(dst)).mkdir(parents=True,exist_ok=True)
        if os.path.isdir(src):
            shutil.copytree(src,dst)
        else:
            shutil.copy(src,dst)
        return

    # Check files
    for real, this in get_tracked(f_path):
        # Check if the file even exists on system
        if not os.path.exists(real):
            # If it's a dir, just make it
            if os.path.isdir(this):
                if not args.dry:
                    Path(real).mkdir(parents=True,exist_ok=True)
            # Otherwise, more work is needed
            else:
                if args.copy_missing:
                    print(f"Copying {this} to {real}")
                    if not args.dry:
                        shutil.copy(this,real)
                else:
                    print(f"{real} is missing")
            continue
        # Check if the file is different
        if not fill_eq(real, this):
            if args.ask_different:
                choice = input(f"Differences with {real}. [U]pdate, [C]opy, or [I]gnore? ")
                choice = choice.lower()[0]
                if choice == "u":
                    print(f"Updating {real} to {this}")
                    if not args.dry:
                        shutil.copy(real,this)
                elif choice == "c":
                    print(f"Copying {this} to {real}")
                    if not args.dry:
                        shutil.copy(this,real)
                elif choice == "i":
                    print(f"Ignoring {real}...")
                else:
                    print(f"Choice {choice} not understood, ignoring...")
            elif args.update_different:
                if not args.dry:
                    shutil.copy(real,this)
            elif args.copy_different:
                if not args.dry:
                    shutil.copy(this,real)
            else:
                print(f"Inconsistencies between {real} and {this}")

if __name__ == "__main__":
    main()
