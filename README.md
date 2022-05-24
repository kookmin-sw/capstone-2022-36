# Binary Diff 및 Dataset 수집 도구 구현

[2022년 국민대학교 소프트웨어학부 캡스톤디자인 산학자유분반 36팀]

---

## 1. 프로젝트 소개

본 프로젝트는 binary diff 도구 B2R2-BinDiff를 구현하여 오픈 소스 바이너리 분석 플랫폼인 B2R2에 탑재하고, Binary Diff를 위한 Dataset을 수집하는 도구를 구현합니다.

바이너리 분석은 소프트웨어 보안을 실현하기 위해 필수적인 요소입니다. 이는 단순히 소스코드가 없을 때 취약점 분석을 위해 기존 소스코드를 유추하는 기술을 의미하는 것만은 아닙니다. 오히려 소스코드 보유 여부와 상관없이 수행해야 하고, 심지어 완전한 소스코드를 보유하더라도 바이너리의 정보를 획득하기 위해 바이너리 분석은 필수적입니다.

최근 국내외에서 바이너리 분석 도구나 플랫폼을 개발하기 위한 많은 연구가 진행 중입니다. 현재 한국과학기술원에서는 B2R2라고 불리는 바이너리 분석 엔진을 개발 중에 있습니다. B2R2는 바이너리의 의미를 해석하는 틀을 제공하며, 이를 통해 분석가는 자신이 원하는 분석기를 손쉽게 만들 수 있습니다. 해당 기술은 NDSS BAR 학회에서 최우수 논문상을 수상하는 등, 국내외에서 인정을 받고 있습니다.

본 프로젝트에서는 바이너리 패치 분석의 기본이 되는 차이점 비교(diff) 알고리즘에 대해 연구하고 그것을 B2R2 프레임워크 내에 적용하는 것을 주 목적으로 합니다. 바이너리의 차이점을 비교하는 과정을 통해 바이너리 패치의 의미를 보다 정확하고 신속하게 파악할 수 있습니다. 개발된 알고리즘과 도구는 패치 분석뿐 아니라 바이너리 코드 유사도를 비교하는 등의 연구에도 확대 적용 가능합니다.

## 2. Abstract

In this project we implements the binary diff tool B2R2-BinDiff, mounts it on B2R2, an open source binary analysis platform, and implements a tool to collect datasets for binary diff.

Binary analysis is essential to realizing software security. This does not simply mean the technology of inferring the existing source code for vulnerability analysis when there is no source code. Rather, it has to be performed regardless of whether you have the source code or not, and even if you have the complete source code, binary analysis is essential to obtain binary information.

Recently, a lot of research is underway to develop binary analysis tools or platforms at home and abroad. Currently, the Korea Advanced Institute of Science and Technology(KAIST) is developing a binary analysis engine called B2R2. B2R2 provides a framework for interpreting the meaning of binaries, allowing analysts to easily create their own desired analyzers. The technology has been recognized at home and abroad, such as winning the best paper award at the NDSS BAR conference.

The main purpose of this project is to study the diff algorithm, which is the basis of binary patch analysis, and to apply it within the B2R2 framework. By comparing the differences between binaries, you can understand the meaning of binary patches more accurately and quickly. The developed algorithms and tools can be broadly applied not only to patch analysis, but also to studies such as comparing binary code similarity.

## 3. 팀 소개

```
윤형준(학부생) ****2235
  논문 조사 및 발표, 개발, 연구, 프로젝트 일정 및 산출물 관리

차상길(산학 멘토)
  논문 추천, 연구 방향성 제시, 코드 리뷰, 매주 온라인 미팅 및 피드백
```

산학분반 자유주제 팀으로 학부생 단독 팀입니다.

## 4. Dependencies

### 4.1 Ubuntu Linux

본 프로젝트는 `Ubuntu Linux 20.04.2 LTS (x64)`에서 테스트되었습니다.

B2R2-BinDiff는 .NET SDK에 의존하기 때문에 운영체제에 상관없이 동작 가능하나, Binary-Gleaner는 Python3와 Unix의 shell script들로 구성되어 있습니다.

### 4.2 .NET Core SDK

본 프로젝트의 `B2R2-BinDiff`는 [B2R2 0.5.0](https://github.com/topcue/B2R2/tree/master)에 탑재됩니다.

따라서 B2R2 0.5.0을 구동하기 위한 환경이 필요합니다.

.[NET Core SDK 5.0버전과 6.0 버전](https://dotnet.microsoft.com/en-us/download/dotnet)을 설치해야 합니다.

- Install .NET

```bash
wget https://dot.net/v1/dotnet-install.sh
./dotnet-install.sh -c 5.0
./dotnet-install.sh -c 6.0
```

## 5. Usage

- 편의를 위해 작업 공간을 등록합니다.

```bash
# mkdir demo && cd demo
export WORKSPACE=`pwd`
echo $WORKSPACE
```

- capstone-2022-36 repo를 clone한 뒤, submodule을 업데이트합니다.

```bash
cd $WORKSPACE
git clone https://github.com/kookmin-sw/capstone-2022-36 && cd $WORKSPACE/capstone-2022-36
git submodule init
git submodule update

cd $WORKSPACE/capstone-2022-36/B2R2 && git checkout master
cd $WORKSPACE/capstone-2022-36/binary-gleaner && git checkout main
cd $WORKSPACE/capstone-2022-36
```

- B2R2를 build합니다.

```bash
dotnet build $WORKSPACE/capstone-2022-36/B2R2
```

- B2R2-BinDiff example

```bash
$WORKSPACE/capstone-2022-36/demo1.sh
$WORKSPACE/capstone-2022-36/demo2.sh
$WORKSPACE/capstone-2022-36/demo3.sh
$WORKSPACE/capstone-2022-36/demo5.sh
$WORKSPACE/capstone-2022-36/demo6.sh
```

- Binary-Gleaner example

```bash
cd $WORKSPACE/capstone-2022-36/binary-gleaner
python main.py
```

## 6. Demo

- 두 바이너리 파일 Diff 결과 (CODE 영역 .text section 중 일부)

![https://user-images.githubusercontent.com/26249582/169651554-10f5423a-d72f-486e-a718-73c0fefc86d5.png](https://user-images.githubusercontent.com/26249582/169651554-10f5423a-d72f-486e-a718-73c0fefc86d5.png)

- 두 바이너리 파일 Diff 결과 (DATA 영역)

![https://user-images.githubusercontent.com/26249582/169651555-26cf0968-3d83-4089-b58a-0abdf873d39d.png](https://user-images.githubusercontent.com/26249582/169651555-26cf0968-3d83-4089-b58a-0abdf873d39d.png)
